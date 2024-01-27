contract c18262{
    /**
    * @dev Function is called by contributor to refund
    * Buy user tokens for refundTokenPrice and destroy them
    */
    function refundTokenHolder() public {
        require(state == FundState.Refund);
        uint256 tokenBalance = token.balanceOf(msg.sender);
        require(tokenBalance > 0);
        uint256 refundAmount = safeDiv(safeMul(tokenBalance, address(this).balance), token.totalSupply());
        require(refundAmount > 0);
        token.destroy(msg.sender, tokenBalance);
        msg.sender.transfer(refundAmount);
        RefundHolder(msg.sender, refundAmount, tokenBalance, now);
    }
}