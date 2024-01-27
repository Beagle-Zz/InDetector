contract c8578{
    /**
     * Called by an advertiser when he/she would like to make a refund request.
     *
     * @param amount    The amount the advertiser would like to withdraw
     */
    function requestForRefund (uint amount) public {
        // Make sure that advertisers are requesting a refund for how much ever
        // ether they have.
        require(amount > 0, "Amount should be greater than 0");
        require(advertiserBalances[msg.sender] > 0, "You have no balance");
        require(advertiserBalances[msg.sender] >= amount, "Insufficient balance to refund");
        // push the refund request in a refundQueue so that it can be processed
        // later.
        refundQueue.push(refundRequest(msg.sender, amount, now, now + refundRequestTimelock));
        // Add the index into a hashmap for later use
        advertiserRefundRequestsIndex[msg.sender] = refundQueue.length - 1;
        // Emit events
        emit RefundAdvertiserRequested(msg.sender, amount, refundQueue.length - 1);
    }
}