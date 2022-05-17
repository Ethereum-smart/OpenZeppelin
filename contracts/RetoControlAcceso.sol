// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

// Implementar dos roles ( ADMIN, WRITER )
// "ADMIN" puede agregar y eliminar "WRITE"
// "WRITER" unico que puede ejecutar la funcion store()
// Utilizar modifier

contract Storage is AccessControl {

    bytes32 public constant ADMIN = keccak256("ADMIN");
    bytes32 public constant WRITER = keccak256("WRITER");   

    uint256 number;

    constructor(){
        _setupRole(ADMIN, msg.sender);
    }

    modifier functionAccess ( bytes32 _role ) {
        require(
            hasRole( _role , msg.sender),
            "Sender not authorized"
        );
        _;
    }


    function addRol( address account  ) public functionAccess( ADMIN ) {
        _grantRole(WRITER, account);
    }

    function revokeRol( address account ) public functionAccess( ADMIN ) {
        _revokeRole(WRITER, account);
    }
    
    function store(uint256 num) public functionAccess( WRITER ) {
        number = num;
    }

    function retrieve() public view returns (uint256){
        return number;
    }
}