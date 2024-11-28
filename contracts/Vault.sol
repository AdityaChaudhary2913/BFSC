// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackVault{
    constructor(address _add, uint _pass){
        Vault(_add).unlock(_pass);
    }
}

contract Vault {
    bool public locked;
    uint private password;

    constructor(uint _password) {
        locked = true;
        password = _password;
    }

    function unlock(uint _password) public {
        if (password == _password) {
            locked = false;
        }
    }
}