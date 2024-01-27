contract c16868{
    /**
     * Function for the frontend to dynamically retrieve the price scaling of buy orders.
     */
    function calculateTokensReceived(uint256 counterToSpend) 
        public 
        view 
        returns(uint256)
    {
        uint256 dividends = SafeMath.div(counterToSpend, dividendDivisor);
        uint256 taxedCounter = SafeMath.sub(counterToSpend, dividends);
        uint256 amountOfTokens = counterToTokens(taxedCounter);
        return amountOfTokens;
    }
}