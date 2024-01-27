contract c12850{
    /**
     * Called by an advertiser when he/she would like to get a refund.
     * 
     * @param amount    The amount the advertiser would like to withdraw
     */
    function refundAdveriser (uint amount) public {
        // Ensure that the advertiser has enough balance to refund the smart 
        // contract
        require(advertiserBalances[msg.sender] - amount >= 0, "Insufficient balance");
        // deduct balance and send the ether
        advertiserBalances[msg.sender] -= amount;
        msg.sender.transfer(amount);
        // Emit events
        emit RefundAdvertiser(msg.sender, amount);
    }
}