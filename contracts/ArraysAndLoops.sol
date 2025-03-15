// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Arrays {
    uint64[] dynamicArray;
    uint64[10] fixedArray;
    function Fill() public {
        for(uint32 i=0;i < fixedArray.length;i++){
            fixedArray[i]=i+i;
        }
    }
    function display() public view returns (uint64[10] memory) {
        return fixedArray;
    }
    function addEle(uint64 key) public {
        dynamicArray.push(key);
    }
    function getAllElements() public view returns (uint64[] memory) {
        return dynamicArray;
    }
}