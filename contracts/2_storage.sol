// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Storage {
    string storedInfo;
    uint public countChanges;
     
    constructor(string memory _storedInfo) {
        storedInfo = _storedInfo;      
    }

    function setInfo(string memory _storedInfo) external {
        storedInfo = _storedInfo;
        countChanges++;
    }

    function getInfo() public  view returns(string memory){
        return storedInfo ;
    }

}