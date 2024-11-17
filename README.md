# Solidity Smart Contracts Project

## Overview
This project comprises a suite of Solidity smart contracts built using **Remix IDE** and deployed on the **Ethereum Sepolia test network** via **MetaMask**. The main contracts include:

1. **SimpleStorage**: A basic storage contract for storing and retrieving a favorite number.
2. **StorageFactory**: A factory contract that deploys instances of `SimpleStorage` and interacts with them.
3. **AdvancedStorage**: An extended version of `SimpleStorage` that adds functionality for recording a timestamp when a number is stored.
4. **Parent1, Parent2, and Child Contracts**: Demonstrate inheritance and method overriding in Solidity.

## Contract Details

### 1. SimpleStorage
**File**: `SimpleStorage.sol`

**Description**: A simple contract that stores a single `uint256` value and provides methods to update and retrieve it.

**Key Functions**:
- `storeNumber(uint256 _favoriteNumber)`: Stores the input value.
- `getFavoriteNumber() view returns (uint256)`: Retrieves the stored value.

**Code Snippet**:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 public favoriteNumber;

    function storeNumber(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }
}
```

### 2. StorageFactory
**File**: `StorageFactory.sol`

**Description**: A contract that deploys and manages multiple `SimpleStorage` contracts.

**Key Functions**:
- `deploySimpleStorage()`: Deploys a new instance of `SimpleStorage`.
- `setStorageData(uint256 index, uint256 _data)`: Stores a value in the specified `SimpleStorage` contract.
- `getStorageData(uint256 index) view returns (uint256)`: Retrieves the stored value from the specified contract.

**Code Snippet**:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public storageContracts;

    function deploySimpleStorage() public {
        SimpleStorage newStorage = new SimpleStorage();
        storageContracts.push(newStorage);
    }

    function setStorageData(uint256 index, uint256 _data) public {
        SimpleStorage storageInstance = storageContracts[index];
        storageInstance.storeNumber(_data);
    }

    function getStorageData(uint256 index) public view returns (uint256) {
        return storageContracts[index].getFavoriteNumber();
    }
}
```

### 3. AdvancedStorage
**File**: `AdvancedStorage.sol`

**Description**: Inherits from `SimpleStorage` and overrides its function to include a timestamp.

**Key Functions**:
- `storeNumber(uint256 _favoriteNumber)`: Stores the input value and saves the current block timestamp.
- `getWithTimestamp() view returns (uint256, uint256)`: Returns both the stored value and the timestamp.

**Code Snippet**:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./SimpleStorage.sol";

contract AdvancedStorage is SimpleStorage {
    uint256 public timestamp;

    function storeNumber(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber;
        timestamp = block.timestamp;
    }

    function getWithTimestamp() public view returns (uint256, uint256) {
        return (favoriteNumber, timestamp);
    }
}
```

### 4. Parent1, Parent2, and Child Contracts
**File**: `Inheritance.sol`

**Description**: Demonstrates multiple inheritance and how to resolve method conflicts.

**Key Contracts**:
- `Parent1` and `Parent2`: Define `foo()` functions with the `virtual` keyword.
- `Child`: Inherits from `Parent1` and `Parent2`, and overrides `foo()` to merge the results.

**Code Snippet**:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Parent1 {
    function foo() public pure virtual returns (string memory) {
        return "Parent1";
    }
}

contract Parent2 {
    function foo() public pure virtual returns (string memory) {
        return "Parent2";
    }
}

contract Child is Parent1, Parent2 {
    function foo() public pure override(Parent1, Parent2) returns (string memory) {
        return string(abi.encodePacked(Parent1.foo(), " + ", Parent2.foo()));
    }
}
```

## Setup and Deployment
1. **Open** the `REMIX IDE` and create new files for each contract.
2. **Compile** each contract using Solidity compiler version `0.8.25`.
3. **Connect** MetaMask to **Ethereum Sepolia test network**.
4. **Deploy** the contracts from Remix:
   - Deploy `SimpleStorage` to test basic storage functionality.
   - Deploy `StorageFactory` to create and manage multiple `SimpleStorage` instances.
   - Deploy `AdvancedStorage` to test timestamp functionality.
   - Deploy `Child` to see method overriding and inheritance resolution.

## License
All contracts are under the [MIT License](LICENSE).

## Authors
Developed as a demonstration of Solidity features including inheritance, contract deployment, and data handling.

---
**Note**: Ensure you have Sepolia test ETH in your MetaMask wallet for deploying and interacting with these contracts.

