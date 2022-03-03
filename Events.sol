// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.5.13;

contract EventExample {
    
    mapping (address => uint) public tokenBalance;

    event TokenSent(address _from, address _to, uint _amount);


    constructor () public {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not Enough tokens");
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[_to]);
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        tokenBalance[msg.sender] -=_amount;
        tokenBalance[_to] += _amount;
        
        emit TokenSent(msg.sender, _to, _amount);
        return true; 
    }

}