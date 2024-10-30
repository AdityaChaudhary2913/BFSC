// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    address payable public owner;
    // Only address payable can recieve ether transfers

    event Occupy(address occupant, uint value);

    enum Statuses { Vacant, Occupied }

    Statuses public currentStatus;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    // if on line 5, we have "require(query)", then code
    // after line 5 will only execute if query is true

    modifier onlyWhenVacant{
        require(currentStatus == Statuses.Vacant, "Currently Occupied!");
        _;
    }

    modifier cost(uint amount) {
        require(msg.value >= amount, "Not enough Ether provided!");
        _;
    }

    function book() public payable onlyWhenVacant cost(2 ether) {
        // Transfer function here sends the currency to owner
        // Currency comes from the function calling book function
        // Amount of currency is msg.value
        // owner.transfer(msg.value);
        
        // we can also use below code for transfering currency
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        currentStatus = Statuses.Occupied;

        emit Occupy(msg.sender, msg.value);
    }
}