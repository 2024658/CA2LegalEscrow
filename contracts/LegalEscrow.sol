// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LegalEscrow {
    address payable public client;
    address payable public solicitor;
    uint public amount;
    bool public serviceCompleted;

    constructor(address payable _solicitor) {
        client = payable(msg.sender);
        solicitor = _solicitor;
    }

    // Client deposits funds into escrow
    function deposit() external payable {
        require(msg.sender == client, "Only client can deposit");
        require(msg.value > 0, "Deposit must be greater than zero");
        amount = msg.value;
    }

}
