//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Owner is Ownable {

    function normalThings() public {
        // anyone can call this function
    }

    function specialThings() public onlyOwner {
        // only de owner can call this function
    }
    
}
