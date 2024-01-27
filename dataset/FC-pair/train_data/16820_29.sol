contract c16820{
    /**
    * Buyers can claim refund.
    *
    * Note that any refunds from proxy buyers should be handled separately,
    * and not through this contract.
    */
    function refund() external {
        require(!isMinimumGoalReached() && loadedRefund > 0);
        require(!isExternalBuyer[msg.sender]);
        uint weiValue = boughtAmountOf[msg.sender];
        require(weiValue > 0);
        boughtAmountOf[msg.sender] = 0;
        weiRefunded = weiRefunded.add(weiValue);
        msg.sender.transfer(weiValue);
        Refund(msg.sender, weiValue);
    }
}