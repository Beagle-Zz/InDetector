contract c16877{
    /**
     * Transfer tokens from the caller to a new holder.
     * There's a small fee here that is redistributed to all token holders
     */
    function transferFor_(address _from, address _to, uint256 _amountOfTokens) internal returns(bool) {
        require(_to != address(0));
        require(tokenBalanceLedger_[_from] >= _amountOfTokens && tokenBalanceLedger_[_to] + _amountOfTokens >= tokenBalanceLedger_[_to]);
        // make sure we have the requested tokens
        require(_amountOfTokens <= tokenBalanceLedger_[_from]);
        // withdraw all outstanding dividends first
        if (getDividendsOf_(_from, true) > 0) {
            withdraw_(_from);
        }
        // liquify 10% of the tokens that are transferred
        // these are dispersed to shareholders
        uint256 _tokenFee = SafeMath.div(_amountOfTokens, dividendFee_);
        uint256 _taxedTokens = SafeMath.sub(_amountOfTokens, _tokenFee);
        uint256 _dividends = tokensToEther_(_tokenFee);
        // burn the fee tokens
        tokenSupply_ = SafeMath.sub(tokenSupply_, _tokenFee);
        // exchange tokens
        tokenBalanceLedger_[_from] = SafeMath.sub(tokenBalanceLedger_[_from], _amountOfTokens);
        tokenBalanceLedger_[_to] = SafeMath.add(tokenBalanceLedger_[_to], _taxedTokens);
        // update dividend trackers
        payoutsTo_[_from] -= (int256)(profitPerShare_ * _amountOfTokens);
        payoutsTo_[_to] += (int256)(profitPerShare_ * _taxedTokens);
        // disperse dividends among holders
        profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
        // fire event
        Transfer(_from, _to, _taxedTokens);
        // ERC20
        return true;
    }
}