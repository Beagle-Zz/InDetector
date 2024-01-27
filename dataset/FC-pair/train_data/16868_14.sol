contract c16868{
    /**
     * Liquifies tokens to counter.
     */
    function sell(uint256 amountOfTokens)
        onlyTokenHolders()
        public
    {
        require(amountOfTokens > 0);
        // setup data
        address customerAddress = msg.sender;
        // russian hackers BTFO
        require(amountOfTokens <= tokenBalanceLedger[customerAddress]);
        uint256 tokens = amountOfTokens;
        uint256 counterAmount = tokensToCounter(tokens);
        uint256 dividends = dividendDivisor > 0 ? SafeMath.div(counterAmount, dividendDivisor) : 0;
        uint256 taxedCounter = SafeMath.sub(counterAmount, dividends);
        // burn the sold tokens
        tokenSupply = SafeMath.sub(tokenSupply, tokens);
        tokenBalanceLedger[customerAddress] = SafeMath.sub(tokenBalanceLedger[customerAddress], tokens);
        // update dividends tracker
        int256 updatedPayouts = (int256) (profitPerShare * tokens + (taxedCounter * magnitude));
        payoutsTo[customerAddress] -= updatedPayouts;       
        // dividing by zero is a bad idea
        if (tokenSupply > 0 && dividendDivisor > 0) {
            // update the amount of dividends per token
            profitPerShare = SafeMath.add(profitPerShare, (dividends * magnitude) / tokenSupply);
        }
        // fire event
        emit Sell(customerAddress, tokens, taxedCounter);
    }
}