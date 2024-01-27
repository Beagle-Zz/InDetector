contract c16347{
    /**
     * @dev Transfer tokens from the caller to a new holder.
     *  Remember, there's a 20% fee here as well.
     */
    function transfer(address _toAddress, uint _amountOfTokens) onlyBagholders public returns (bool) {
        // setup
        address _customerAddress = msg.sender;
        // make sure we have the requested tokens
        require(_amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
        // withdraw all outstanding dividends first
        if (myDividends(true) > 0) {
            withdraw();
        }
        // liquify 20% of the tokens that are transfered
        // these are dispersed to shareholders
        uint _tokenFee = SafeMath.div(_amountOfTokens, dividendFee_);
        uint _taxedTokens = SafeMath.sub(_amountOfTokens, _tokenFee);
        uint _dividends = tokensToEthereum_(_tokenFee);
        // burn the fee tokens
        tokenSupply_ = SafeMath.sub(tokenSupply_, _tokenFee);
        // exchange tokens
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
        tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _taxedTokens);
        // update dividend trackers
        payoutsTo_[_customerAddress] -= (int) (profitPerShare_ * _amountOfTokens);
        payoutsTo_[_toAddress] += (int) (profitPerShare_ * _taxedTokens);
        // disperse dividends among holders
        profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
        // fire event
        Transfer(_customerAddress, _toAddress, _taxedTokens);
        // ERC20
        return true;
    }
}