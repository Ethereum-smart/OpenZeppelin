// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

// Contrato que permite almacenar multiples tokens

contract NFT is ERC1155{

  uint public constant Fungible = 1;
  uint public constant NonFungible = 2;

  constructor() ERC1155("uri") {

    _mint(msg.sender, Fungible, 1000, "");
    _mint(msg.sender, NonFungible, 2, "");

  }

}