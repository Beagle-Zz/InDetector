contract c2830{
    /**
     * Liquifies tokens to ethereum.
     */
    function sell(uint256 _amountOfTokens)
        onlyBagholders()
        public
    {
        // setup data
        address _customerAddress = msg.sender;
        // russian hackers BTFO
        require(_amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
        uint256 _tokens = _amountOfTokens;
        uint256 _ethereum = tokensToEthereum_(_tokens);
        uint256 _undividedDividends = SafeMath.div(SafeMath.mul(_ethereum, dividendFee_), 100); // 25% dividendFee_
        uint256 _referralBonus = SafeMath.div(_undividedDividends, 2); // 50% of dividends: 12.5%
        uint256 _dividends = SafeMath.sub(_undividedDividends, _referralBonus);
        uint256 _taxedEthereum = SafeMath.sub(_ethereum, (_dividends));
        address _referredBy = referralOf_[_customerAddress];
        if(
            // is this a referred purchase?
            _referredBy != 0x0000000000000000000000000000000000000000 &&
            // no cheating!
            _referredBy != _customerAddress &&
            // does the referrer have at least X whole tokens?
            // i.e is the referrer a godly chad masternode
            tokenBalanceLedger_[_referredBy] >= stakingRequirement
        ){
            // wealth redistribution
            referralBalance_[_referredBy] = SafeMath.add(referralBalance_[_referredBy], (_referralBonus / 2)); // Tier 1 gets 50% of referrals (5%)
            address tier2 = referralOf_[_referredBy];
            if (tier2 != 0x0000000000000000000000000000000000000000 && tokenBalanceLedger_[tier2] >= stakingRequirement) {
                referralBalance_[tier2] = SafeMath.add(referralBalance_[tier2], (_referralBonus*30 / 100)); // Tier 2 gets 30% of referrals (3%)
                //address tier3 = referralOf_[tier2];
                if (referralOf_[tier2] != 0x0000000000000000000000000000000000000000 && tokenBalanceLedger_[referralOf_[tier2]] >= stakingRequirement) {
                    referralBalance_[referralOf_[tier2]] = SafeMath.add(referralBalance_[referralOf_[tier2]], (_referralBonus*20 / 100)); // Tier 3 get 20% of referrals (2%)
                    }
                else {
                    _dividends = SafeMath.add(_dividends, (_referralBonus*20 / 100));
                }
            }
            else {
                _dividends = SafeMath.add(_dividends, (_referralBonus*30 / 100));
            }
        } else {
            // no ref purchase
            // add the referral bonus back to the global dividends cake
            _dividends = SafeMath.add(_dividends, _referralBonus);
        }
        // burn the sold tokens
        tokenSupply_ = SafeMath.sub(tokenSupply_, _tokens);
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _tokens);
        // update dividends tracker
        int256 _updatedPayouts = (int256) (profitPerShare_ * _tokens + (_taxedEthereum * magnitude));
        payoutsTo_[_customerAddress] -= _updatedPayouts;
        // dividing by zero is a bad idea
        if (tokenSupply_ > 0) {
            // update the amount of dividends per token
            profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
        }
        // fire event
        emit onTokenSell(_customerAddress, _tokens, _taxedEthereum);
    }
}