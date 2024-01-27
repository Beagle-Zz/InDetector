contract c16956{
    // low level token purchase function
    function buyTokens(address _beneficiary) saleIsOn isUnderHardCap nonReentrant public payable {
        require(_beneficiary != address(0));
        require(msg.value >= minimumInvest);
        uint256 weiAmount = msg.value;
        uint256 tokens = getTokenAmount(weiAmount);
        tokens = tokens.add(tokens.mul(bonusPercent).div(100));
        token.mint(_beneficiary, tokens);
        // update states
        weiRaised = weiRaised.add(weiAmount);
        balances[_beneficiary] = balances[_beneficiary].add(weiAmount);
        TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
    }
}