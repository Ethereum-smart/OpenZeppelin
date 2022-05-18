// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenReto is Ownable, ERC20, ERC20Burnable, Pausable {

  constructor() ERC20Burnable() ERC20("Center Planet Core", "CPC") {
    _mint(msg.sender, 10);
  }

  function miningToken () public onlyOwner { 
      require(paused() == false, "Cannot mining more token");
      _mint(msg.sender, 1);
  }

  function burnableToken ( uint32 amount ) public onlyOwner {
    require(paused() == false, "Cannot burn any token");
    burn(amount);
  }

  function pausableMining () public onlyOwner{
    _pause();
  }

  function continueMining () public onlyOwner{
    _unpause();
  }

}