// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.5.12;

contract StartStopUpdateExample {
    address owner;
    bool public paused; //default false

    constructor () public { 
    owner = msg.sender; 

    }


    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }

    function withdrawAllMoney (address payable _to) public {
        require(msg.sender == owner, "You are not the owner"); 
        require(!paused, "Contract is paused"); // paused == false
        _to.transfer(address(this).balance);
        
    }

    function DestroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not owner");
        selfdestruct(_to);
    }
    
}