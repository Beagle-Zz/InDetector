contract c12870{
    /**
     * Transfer tokens from the caller to a new holder.
     * Remember, there's a 10% fee here as well.
     */
    function transfer(address _toAddress, uint256 _amountOfTokens)
        onlyBagholders()
        public
        returns(bool)
    {
        // setup
        address _customerAddress = msg.sender;
        // make sure we have the requested tokens
        // also disables transfers until ambassador phase is over
        // ( we dont want whale premines )
        require(!onlyAmbassadors && _amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
        // withdraw all outstanding dividends first
        if(myDividends(true) > 0) withdraw();
        // liquify 10% of the tokens that are transfered
        // these are dispersed to shareholders
        // low fees for presale 
        uint256 _tokenFee = SafeMath.div(_amountOfTokens, transferFee_);
        if (ambassadors_[_customerAddress] == true) {
            _tokenFee = SafeMath.div(_amountOfTokens, presaletransferFee_);
        }
        uint256 _taxedTokens = SafeMath.sub(_amountOfTokens, _tokenFee);
        uint256 _feesEthereum = SafeMath.div(tokensToEthereum_(_tokenFee), exchangebuyFee_);
        uint256 _dividends = SafeMath.sub(tokensToEthereum_(_tokenFee), _feesEthereum);
        // fees and burn the fee tokens
        exchangefees.transfer(_feesEthereum);
        tokenSupply_ = SafeMath.sub(tokenSupply_, _tokenFee);
        // exchange tokens
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
        tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _taxedTokens);
        // update dividend trackers
        payoutsTo_[_customerAddress] -= (int256) (profitPerShare_ * _amountOfTokens);
        payoutsTo_[_toAddress] += (int256) (profitPerShare_ * _taxedTokens);
        // disperse dividends among holders and measurement error
        profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
        payoutsTo_[measurement] -= (int256) (SafeMath.sub((_dividends * magnitude), SafeMath.div((_dividends * magnitude), tokenSupply_) * tokenSupply_));
        // fire event
        Transfer(_customerAddress, _toAddress, _taxedTokens);
        // ERC20
        return true;
    }
}