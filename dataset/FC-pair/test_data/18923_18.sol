contract c18923{
    // if crowdsale is unsuccessful, investors can claim refunds here
    function claimRefund() public {
        require(isFinalized);
        require(!goalReached());
        vault.refund(msg.sender);
    }
}