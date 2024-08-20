// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.22;

contract Register01 {
    string private storedInfo_ethkipu;

    function setInfo(string memory myInfo) external {
        storedInfo_ethkipu = myInfo;
    }

    function getInfo() external view returns (string memory) {
        return storedInfo_ethkipu;
    }
}