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

    // Solicitor confirms service completion
    function confirmServiceCompletion() external {
        require(msg.sender == solicitor, "Only solicitor can confirm");
        serviceCompleted = true;
    }
    // release payments
    function releasePayment() external {
    require(serviceCompleted, "Service not completed");
    require(address(this).balance > 0, "No funds to release");

    (bool success, ) = solicitor.call{value: address(this).balance}("");
    require(success, "Payment transfer failed");
}
//refund client
function refundClient() external {
    require(msg.sender == client, "Only client can request refund");
    require(!serviceCompleted, "Service already completed");

    (bool success, ) = client.call{value: address(this).balance}("");
    require(success, "Refund failed");
}

}
