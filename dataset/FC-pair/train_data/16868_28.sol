contract c16868{
    /**
     * Return the sell price of 1 individual token.
     */
    function buyPrice() 
        public 
        view 
        returns(uint256)
    {
        // our calculation relies on the token supply, so we need supply. Doh.
        if(tokenSupply == 0){
            return tokenPriceInitial + tokenPriceIncremental;
        } else {
            uint256 counterAmount = tokensToCounter(1e18);
            uint256 dividends = SafeMath.div(counterAmount, dividendDivisor);
            uint256 taxedCounter = SafeMath.add(counterAmount, dividends);
            return taxedCounter;
        }
    }
}