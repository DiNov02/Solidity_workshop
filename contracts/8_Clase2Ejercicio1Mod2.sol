// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Clase2Ejercicio1Mod2{
    address private owner;
    string[] public storedInfos;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender, "Only the owner can modify the contract");
        _;
    }

    modifier checkArrayLength(string[] memory _array, uint _index) {
        require(_index < _array.length, "Index out of bounds");
        _;
    }

    event DataModified(address indexed editor, string indexed key, string value);

    // Add items into the array
    function addItem(string memory _data) onlyOwner public {        
        emit DataModified(msg.sender, "Data", _data);
        storedInfos.push(_data);
    }

    //Edit item values into the array
    function updateInfos(uint _index, string memory _newData) checkArrayLength(storedInfos, _index) public {        
        storedInfos[_index] = _newData;
    }

    //Get all data from array
    function getOneInfo() external view returns (string[] memory) {
        return storedInfos;
    }




}