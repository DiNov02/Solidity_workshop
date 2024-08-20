// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Clase2Modulo2{
    string public name;
    string public lastName;
    address private owner;
    string[] public names;

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

    function setName(string memory _name) onlyOwner public {        
        emit DataModified(msg.sender, "Name", _name);
        name = _name;
        names.push(name);
    }

    function setLastName(string memory _lastName) onlyOwner public {        
        emit DataModified(msg.sender, "Last Name", _lastName);
        lastName = _lastName;
    }

    function readNames(uint _index) checkArrayLength(names, _index) public view returns (string memory){        
        return names[_index];
    }

    function editNameArray(uint _index, string memory _newName) checkArrayLength(names, _index) public {        
        names[_index] = _newName;
    }
    
    function deleteLastElement() public returns(string[] memory){
        emit DataModified(msg.sender, "deleteLastElement", names[names.length - 1]);
        names.pop(); 
        return names;  
    } 

    function listAllInfo() external view returns (string[] memory) {
        return names;
    }
}