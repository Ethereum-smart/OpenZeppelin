// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract AccessByRol is AccessControl {

  bytes32 public constant ADMIN = keccak256("ADMIN");
  bytes32 public constant USER = keccak256("USER");

  constructor () {
    // Grant the contract deployer the ADMIN role
    _setupRole(ADMIN, msg.sender);
  }

  function onlyAdmin() view public {
    require(hasRole(ADMIN, msg.sender), 'This function onlu can call the ADMIN rol');
  }

  function onlyUser() view public {
    require(hasRole(USER, msg.sender), 'This function onlu can call the USER rol');
  }

  // Only the ADMIN can a new rol
  function addRol( bytes32 role, address account ) public {
    require(hasRole(ADMIN, msg.sender), 'This function onlu can call the ADMIN rol');
    _grantRole(role, account);
  }

}