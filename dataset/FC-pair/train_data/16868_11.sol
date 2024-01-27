contract c16868{
    /**
     * Converts all of caller's dividends to tokens.
     */
    function reinvestDividends()
        onlyDividendHolders()
        public
        returns (uint256)
    {
        // fetch dividends
        uint256 dividends = myDividends(); 
        // pay out the dividends virtually
        address customerAddress = msg.sender;
        payoutsTo[customerAddress] += (int256) (dividends * magnitude);
        // dispatch a buy order with the virtualized "withdrawn dividends" if we have dividends
        uint256 tokens = purchaseTokens(dividends);
        // fire event
        emit Reinvestment(customerAddress, dividends, tokens);
        return tokens;
    }
}