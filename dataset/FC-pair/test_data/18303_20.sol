contract c18303{
    // Investors can claim ether refund if total raised fund doesn't reach our softcap
    function refund() external {
        uint256 refundedAmount = totalInvestedAmountOf[msg.sender];
        uint256 totalRemainingRefund = totalLoadedRefund.sub(totalRefundedAmount);
        uint256 tokenRevoked = balances[msg.sender];
        require(saleState == END_SALE);
        require(!isSoftCapReached());
        require(totalRemainingRefund >= refundedAmount && refundedAmount > 0);
        totalInvestedAmountOf[msg.sender] = 0;
        balances[msg.sender] = 0;
        totalRemainingTokensForSales = totalRemainingTokensForSales.add(tokenRevoked);
        totalRefundedAmount = totalRefundedAmount.add(refundedAmount);
        msg.sender.transfer(refundedAmount);
        emit Refund(msg.sender, refundedAmount, tokenRevoked);
    }    
}