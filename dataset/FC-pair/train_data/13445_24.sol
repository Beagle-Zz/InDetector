contract c13445{
    /*==========================================
    =            INTERNAL FUNCTIONS            =
    ==========================================*/
    /// @dev Internal function to actually purchase the tokens.
    function purchaseTokens(uint256 _incomingEthereum, address _referredBy) internal returns (uint256) {
        require(
            // auto start
            now >= startTime ||
            // ambassador pre-mine within 1 hour before startTime, sequences enforced
            (now >= startTime - 1 hours && !ambassadorsPremined[msg.sender] && ambassadorsPremined[ambassadorsPrerequisite[msg.sender]] && _incomingEthereum <= ambassadorsMaxPremine[msg.sender]) ||
            // ambassador pre-mine within 10 minutes before startTime, sequences not enforced
            (now >= startTime - 10 minutes && !ambassadorsPremined[msg.sender] && _incomingEthereum <= ambassadorsMaxPremine[msg.sender])
        );
        if (now < startTime) {
            ambassadorsPremined[msg.sender] = true;
        }
        // data setup
        address _customerAddress = msg.sender;
        uint256 _undividedDividends = SafeMath.div(SafeMath.mul(_incomingEthereum, entryFee_), 100);
        uint256 _referralBonus = SafeMath.div(SafeMath.mul(_undividedDividends, refferalFee_), 100);
        uint256 _dividends = SafeMath.sub(_undividedDividends, _referralBonus);
        uint256 _taxedEthereum = SafeMath.sub(_incomingEthereum, _undividedDividends);
        uint256 _amountOfTokens = ethereumToTokens_(_taxedEthereum);
        // no point in continuing execution if OP is a poorfag russian hacker
        // prevents overflow in the case that the pyramid somehow magically starts being used by everyone in the world
        // (or hackers)
        // and yes we know that the safemath function automatically rules out the "greater then" equasion.
        require(_amountOfTokens > 0 && SafeMath.add(_amountOfTokens, tokenSupply_) > tokenSupply_);
        // is the user referred by a masternode?
        if (
            // is this a referred purchase?
            _referredBy != 0x0000000000000000000000000000000000000000 &&
            // no cheating!
            _referredBy != _customerAddress &&
            // does the referrer have at least X whole tokens?
            // i.e is the referrer a godly chad masternode
            tokenBalanceLedger_[_referredBy] >= stakingRequirement
        ) {
            // wealth redistribution
            referralBalance_[_referredBy] = SafeMath.add(referralBalance_[_referredBy], _referralBonus);
        } else {
            // no ref purchase
            // add the referral bonus back to the global dividends cake
            _dividends = SafeMath.add(_dividends, _referralBonus);
        }
        // add tokens to the pool
        tokenSupply_ = SafeMath.add(tokenSupply_, _amountOfTokens);
        // update circulating supply & the ledger address for the customer
        tokenBalanceLedger_[_customerAddress] = SafeMath.add(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
        // Tell MoonInc contract for tokens amount change, and transfer dividends.
        moonIncContract.handleProductionIncrease.value(_dividends)(_customerAddress, _amountOfTokens * cookieProductionMultiplier);
        // fire event
        onTokenPurchase(_customerAddress, _incomingEthereum, _amountOfTokens, _referredBy, now, buyPrice());
        return _amountOfTokens;
    }
}