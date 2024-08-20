// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Counter {
    uint public counter;
    uint public countChanges = 0;
    
    address public owner;
    
    constructor(uint256 _counter) {
        counter = _counter;
        owner = msg.sender;
    }

    function setCounter(uint _myinfo) public {
        counter = _myinfo;
        counter++;
    }

    function addCounter() public {
        counter+=1;
    }
    function getCounter() public view returns (uint){
        return counter;
    }

}