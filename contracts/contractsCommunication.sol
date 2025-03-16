// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import './Helloworld.sol';
contract ContractCommunication{
    string public communicate="This is contract communication";

    Helloworld hello=Helloworld(0xa42b1378D1A84b153eB3e3838aE62870A67a40EA);


    function getCommunicate() public view returns (string memory) {
        return communicate;
    }

    function getWelcome() public view returns (string memory) {
        return hello.welcome();
    }
}