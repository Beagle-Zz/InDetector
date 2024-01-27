contract c13437{
    // low level token purchase function
    function buyTokens(address _beneficiary) saleIsOn isUnderHardCap nonReentrant public payable {
        require(_beneficiary != address(0));
        require(msg.value >= minimumInvest);
        uint256 weiAmount = msg.value;
        uint256 tokens = getTokenAmount(weiAmount);
        uint256 bonusPercent = getBonusPercent();
        tokens = tokens.add(tokens.mul(bonusPercent).div(100));
        token.mint(_beneficiary, tokens);
        // update states
        weiRaised = weiRaised.add(weiAmount);
        balances[_beneficiary] = balances[_beneficiary].add(weiAmount);
        balancesInToken[_beneficiary] = balancesInToken[_beneficiary].add(tokens);
        // update timestamps and begin Refundable stage
        if (weiRaised >= hardCap) {
            endCrowdSaleTime = now;
            endRefundableTime = endCrowdSaleTime + 108 * 1 days;
        }
        TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
    }
}