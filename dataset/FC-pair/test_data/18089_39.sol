contract c18089{
    /**
     * @dev Function is called by contributor to refund BNB token payments if crowdsale failed to reach soft cap
     */
    function refundBNBContributor() public {
        require(bnbRefundEnabled);
        require(bnbContributions[msg.sender] > 0);
        uint256 amount = bnbContributions[msg.sender];
        bnbContributions[msg.sender] = 0;
        bnbToken.transfer(msg.sender, amount);
        token.destroy(msg.sender, token.balanceOf(msg.sender));
    }
}