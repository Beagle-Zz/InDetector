contract c11176{
    /**
     * Converts all of caller's dividends to tokens.
     */
    function reinvest()
        onlyStronghands()
        public
    {
        // fetch dividends
        uint256 _dividends = myDividends(); // retrieve ref. bonus later in the code
        // pay out the dividends virtually
        address _customerAddress = msg.sender;
        payoutsTo_[_customerAddress] +=  (int256) (_dividends * magnitude);
        // dispatch a buy order with the virtualized "withdrawn dividends"
        uint256 _tokens = purchaseTokensWithoutDevelopmentFund(_dividends, savedReferrals_[msg.sender]);
        // fire event
        onReinvestment(_customerAddress, _dividends, _tokens);
    }
}