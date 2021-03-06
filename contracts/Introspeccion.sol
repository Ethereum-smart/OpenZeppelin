//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";


// ERC165
// Contrato que verifica si otro contrato implementa
// o no otra interfaz

contract Introspeccion {

  using ERC165Checker for address;

  bytes4 private InterfaceId_ERC721 = 0x80ac58cd;

  /**
    * @dev transfer an ERC721 token from this contract to someone else
    */
  function transferERC721(
      address token,
      address to,
      uint256 tokenId
  )
      public
  {
      require(token.supportsInterface(InterfaceId_ERC721), "IS_NOT_721_TOKEN");
      IERC721(token).transferFrom(address(this), to, tokenId);
  } 
    
}
