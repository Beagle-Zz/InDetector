contract c13445{
    /**
     * @dev Transfer tokens from the caller to a new holder.
     *  Remember, there's a fee here as well.
     */
    function transfer(address _toAddress, uint256 _amountOfTokens) onlyBagholders public returns (bool) {
        // setup
        address _customerAddress = msg.sender;
        // make sure we have the requested tokens
        require(_amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
        // withdraw all outstanding dividends first
        if (myDividends(true) > 0) {
            withdraw();
        }
        // liquify 10% of the tokens that are transfered
        // these are dispersed to shareholders
        uint256 _tokenFee = SafeMath.div(SafeMath.mul(_amountOfTokens, transferFee_), 100);
        uint256 _taxedTokens = SafeMath.sub(_amountOfTokens, _tokenFee);
        uint256 _dividends = tokensToEthereum_(_tokenFee);
        // burn the fee tokens
        tokenSupply_ = SafeMath.sub(tokenSupply_, _tokenFee);
        // exchange tokens
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
        tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _taxedTokens);
        // Tell MoonInc contract for tokens amount change, and transfer dividends.
        moonIncContract.handleProductionDecrease.value(_dividends)(_customerAddress, _amountOfTokens * cookieProductionMultiplier);
        moonIncContract.handleProductionIncrease(_toAddress, _taxedTokens * cookieProductionMultiplier);
        // fire event
        Transfer(_customerAddress, _toAddress, _taxedTokens);
        // ERC20
        return true;
    }
}