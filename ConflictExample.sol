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
    // Override to resolve conflict between Parent1 and Parent2
    function foo() public pure override(Parent1, Parent2) returns (string memory) {
        return string(abi.encodePacked(Parent1.foo(), " + ", Parent2.foo()));
    }
}