contract c16877{
    /**
     * Function for the frontend to dynamically retrieve the price scaling of buy orders.
     */
    function calculateTokensReceived(uint256 _etherToSpend) public view returns(uint256) {
        uint256 _dividends = _etherToSpend.div(dividendFee_);
        uint256 _taxedEther = _etherToSpend.sub(_dividends);
        uint256 _amountOfTokens = etherToTokens_(_taxedEther);
        return _amountOfTokens;
    }
}