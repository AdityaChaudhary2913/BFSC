// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable{
    address owner;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor(){
        owner = msg.sender;
    }
}

contract SecretVault{ // Inheritance
    string secret;

    constructor(string memory _secret){
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract Communication is Ownable{ // Inheritance
    address secretVault;

    constructor(string memory _secret){
        SecretVault secVlt = new SecretVault(_secret);
        secretVault = address(secVlt);
        super; // Calls Ownable constructor
    }

    function getSecret() public view onlyOwner returns(string memory){
        return SecretVault(secretVault).getSecret();
    }
}