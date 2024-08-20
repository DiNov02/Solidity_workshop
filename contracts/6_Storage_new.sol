// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Storage_new {
    string storedInfo;
    uint public countChanges;
    address public lastExecutioner;
    address public  owner;

    constructor(string memory _storedInfo) {
        storedInfo = _storedInfo;  
        owner = msg.sender;    
    }

    function setInfo(string memory _storedInfo) external {
        require(msg.sender == owner, "Only owner");
        require(countChanges < 5, "Mensaje es mayor= a 5");
        storedInfo = _storedInfo;        
        countChanges++;

        lastExecutioner = msg.sender;
    }

    function getInfo() public  view returns(string memory){
        return storedInfo ;
    }

}