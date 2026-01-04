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

}
