// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Calculator {
    uint256 private result=0;

    function add(uint256 number) public {
        result += number;
    }

    function sub(uint256 number) public {
        result -= number;
    }

    function multiply(uint256 number) public {
        result *= number;
    }

    function get() public view returns (uint256) {
        return result;
    }
}