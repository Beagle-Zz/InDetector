contract c18089{
    /**
     * @dev Process BNB token contribution
     * Transfer all amount of tokens approved by sender. Calc bonuses and issue tokens to contributor.
     */
    function processBNBContribution() public whenNotPaused checkTime checkBNBContribution {
        bool additionalBonusApplied = false;
        uint256 bonusNum = 0;
        uint256 bonusDenom = 100;
        (bonusNum, bonusDenom) = getBonus();
        uint256 amountBNB = bnbToken.allowance(msg.sender, address(this));
        bnbToken.transferFrom(msg.sender, address(this), amountBNB);
        bnbContributions[msg.sender] = safeAdd(bnbContributions[msg.sender], amountBNB);
        uint256 tokenBonusAmount = 0;
        uint256 tokenAmount = safeDiv(safeMul(amountBNB, BNB_TOKEN_PRICE_NUM), BNB_TOKEN_PRICE_DENOM);
        rawTokenSupply = safeAdd(rawTokenSupply, tokenAmount);
        if(bonusNum > 0) {
            tokenBonusAmount = safeDiv(safeMul(tokenAmount, bonusNum), bonusDenom);
        }
        if(additionalBonusOwnerState[msg.sender] ==  AdditionalBonusState.Active) {
            additionalBonusOwnerState[msg.sender] = AdditionalBonusState.Applied;
            uint256 additionalBonus = safeDiv(safeMul(tokenAmount, ADDITIONAL_BONUS_NUM), ADDITIONAL_BONUS_DENOM);
            tokenBonusAmount = safeAdd(tokenBonusAmount, additionalBonus);
            additionalBonusApplied = true;
        }
        uint256 tokenTotalAmount = safeAdd(tokenAmount, tokenBonusAmount);
        token.issue(msg.sender, tokenTotalAmount);
        totalBNBContributed = safeAdd(totalBNBContributed, amountBNB);
        LogBNBContribution(msg.sender, amountBNB, tokenAmount, tokenBonusAmount, additionalBonusApplied, now);
    }
}