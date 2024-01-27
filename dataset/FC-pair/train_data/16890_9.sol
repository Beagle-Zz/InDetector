contract c16890{
    /**
     * Transfer tokens from the caller to a new holder.
     */
    function transfer(address _toAddress, uint256 _amountOfTokens)
        onlyBagholders()
        public
        returns(bool)
    {
        // setup
        address _fromAddress = msg.sender;
        // make sure we have the requested tokens
        require(_amountOfTokens > 0 && _amountOfTokens <= tokenBalanceLedger_[_fromAddress]);
        // withdraw all outstanding dividends first
        if(myDividends(true) > 0) withdraw();
        uint256 _tokenFee = SafeMath.div(_amountOfTokens, dividendFee_);
        uint256 _taxedTokens = SafeMath.sub(_amountOfTokens, _tokenFee);
        // exchange tokens
        tokenBalanceLedger_[_fromAddress] = SafeMath.sub(tokenBalanceLedger_[_fromAddress], _amountOfTokens);
        tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _amountOfTokens);
         // update dividend trackers
        payoutsTo_[_fromAddress] -= (int256) (profitPerShare_ * _amountOfTokens);
        payoutsTo_[_toAddress] += (int256) (profitPerShare_ * _taxedTokens);
        // fire event
        emit Transfer(_fromAddress, _toAddress, _amountOfTokens);
        // ERC20
        return true;
    }
}