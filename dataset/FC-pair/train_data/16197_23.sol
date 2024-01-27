contract c16197{
    /// Maximum current purchase amount in Phase 2
    function maxTokenPurchase(address _receiver)
        public
        constant
        when_active
        only_in_phase_2
        returns(uint256 spend)
    {
        uint256 availableTokens = tokenCapPhaseTwo.sub(tokensPurchased);
        uint256 fundingGoalOffset = FUNDING_GOAL.sub(totalReceived);
        uint256 maxInvestment;
        if (buyins[_receiver].received > 0) {
            maxInvestment = availableTokens.mul(auctionEndPrice);
        }
        else {
            maxInvestment = availableTokens.mul(fixedPrice);
        }
        if (maxInvestment > fundingGoalOffset) {
            return fundingGoalOffset;
        }
        else {
            return maxInvestment;
        }
    }
}