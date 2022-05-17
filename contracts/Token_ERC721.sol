// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Token no fungible

contract NFT is ERC721 {

  constructor() ERC721("GameItem", "ITM") {

    // Identificador unico transferencia completa, no se envian fracciones
    _mint(msg.sender, 1);
    
  }

}