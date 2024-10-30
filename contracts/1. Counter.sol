// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{
    // State Variables
    uint count;
    // If we write " uint public count; ", then we dont have to 
    // explicitely creat getter for this state variable
    uint public newCount;

    // Can also avoid constructor by directly giving default value
    uint public avoidConstructor = 2;

    constructor() {
        count = 0;
    }

    function getCount() public view returns(uint) {
        return count;
    }

    function incrementCount() public {
        count ++ ;
    }
}