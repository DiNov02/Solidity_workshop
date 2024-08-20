// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

//allows only the addresses in the mapping to update the state
contract Mappings{
    mapping (address => bool) public whiteList;
    mapping (address => uint) public balances;

    string public name;

    modifier checkIsInWhitelist{
        require(whiteList[msg.sender], "This address is not whitelisted");
        _;
    }
    //eg. 0x167fd509867B387183eEbdf4088c0554Df8Af5ec => true
    function addToWhitelist(address _userAddress) public {
        whiteList[_userAddress] = true ;
    }

    function setName(string memory _name) checkIsInWhitelist public {
        name = _name;
    }

    function addBalance(address _userAddress, uint _balance) checkIsInWhitelist public{
        balances[_userAddress] = _balance;
    } 
    
    function removeFromWhitelist(address _userAddress) public{
        whiteList[_userAddress] = false;
    }
}