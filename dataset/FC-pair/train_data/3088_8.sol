contract c3088{
    /**
     * Transfer tokens from the caller to a new holder.
     */
    function transfer(address _toAddress, uint256 _amountOfTokens)
        onlyTokenHolders()
        noUnAuthContracts()
        public
        returns(bool)
    {
        // setup
        address _customerAddress = msg.sender;
        // make sure we have the requested tokens
        require( _amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
        // withdraw all outstanding dividends first
        if(myDividends(true) > 0) withdraw();
        // update dividend trackers       
        payoutsTo_[_customerAddress] -= (int256) (profitPerShare_ * _amountOfTokens);       
        payoutsTo_[_toAddress] += (int256) (profitPerShare_ * _amountOfTokens);
        // exchange tokens
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
        tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _amountOfTokens);
        // fire event
        emit Transfer(_customerAddress, _toAddress, _amountOfTokens);
        // ERC20
        return true;
    }
}