// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./SimpleStorage.sol";  // Importing SimpleStorage

contract StorageFactory {
    SimpleStorage[] public storageContracts;  // Array to store deployed contracts

    // Function to deploy a new SimpleStorage contract
    function deploySimpleStorage() public {
        SimpleStorage newStorage = new SimpleStorage();
        storageContracts.push(newStorage);  // Store the instance in the array
    }

    // Function to store data in a deployed contract
    function setStorageData(uint256 index, uint256 _data) public {
        SimpleStorage storageInstance = storageContracts[index];
        storageInstance.storeNumber(_data);
    }

    // Function to retrieve data from a deployed contract
    function getStorageData(uint256 index) public view returns (uint256) {
        return storageContracts[index].getFavoriteNumber();
    }
}