//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract IdentificadorToken {

    using ERC165Checker for address;

    modifier isTokenERC20 ( address token ){
        require( token.supportsInterface(type(IERC20).interfaceId) , "Token is not ERC20");
        _;
    }

    modifier isTokenERC721 ( address token ){
        require( token.supportsInterface(type(IERC721).interfaceId) , "Token is not ERC721");
        _;
    }

    function verifyTokenERC20( address token ) isTokenERC20(token) public view returns(string memory) {
        return "is ERC20";
    }

    function verifyTokenERC721( address token ) isTokenERC721(token) public view returns(string memory) {
        return "is ERC721";
    }
}
