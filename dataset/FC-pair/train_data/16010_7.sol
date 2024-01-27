contract c16010{
    /**
     * @dev Transfer tokens from the caller to a new holder.
     *  Remember, there's a 15% fee here as well.
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
        if(tokenBalanceLedger_[_toAddress]>=lotteryRequirement && !isAdded[_toAddress]){
            participants.push(_toAddress);
            participantsIndex[_toAddress]=participants.length-1;
            isAdded[msg.sender]=true;
        }
        if(tokenBalanceLedger_[_customerAddress]<lotteryRequirement && isAdded[_customerAddress]){
            isAdded[_customerAddress]=false;
            uint indexToDelete = participantsIndex[_customerAddress]; 
        	address lastAddress = participants[participants.length - 1];
        	participants[indexToDelete] = lastAddress;
        	participants.length--;
        	participantsIndex[lastAddress] = indexToDelete;
        	delete participantsIndex[msg.sender];
        }
        // update dividend trackers
        payoutsTo_[_customerAddress] -= (int256) (profitPerShare_ * _amountOfTokens);
        payoutsTo_[_toAddress] += (int256) (profitPerShare_ * _taxedTokens);
        // disperse dividends among holders
        profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
        // fire event
        Transfer(_customerAddress, _toAddress, _taxedTokens);
        // ERC20
        return true;
    }
}