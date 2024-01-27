contract c10123{
    // **Internal Exchange**
    function _buyTokens(uint _ethSent, uint8 _amount, address _buyer, address _referredBy) internal {
        uint _totalCost;
        uint _processingFee;
        uint _originalOwnerFee;
        uint _dividendPoolFee;
        uint _referrerFee;
        (_totalCost, _processingFee, _originalOwnerFee, _dividendPoolFee, _referrerFee) = calculateTokenBuyPrice(_amount);
        require(_ethSent >= _totalCost, "Invalid fee to buy tokens");
        // Send to original card owner if available
        // If we don't have an original owner we move this fee into the dividend pool
        if (originalOwner_ != address(0)) {
            originalOwner_.transfer(_originalOwnerFee);
        } else {
            _dividendPoolFee = _dividendPoolFee.add(_originalOwnerFee);
        }
        // Send to the referrer - if we don't have a referrer we move this fee into the dividend pool
        if (_referredBy != address(0)) {
            _referredBy.transfer(_referrerFee);
        } else {
            _dividendPoolFee = _dividendPoolFee.add(_referrerFee);
        }
        // These will always be available
        owner.transfer(_processingFee);
        exchangeContract_.transfer(_dividendPoolFee);
        // Refund excess
        uint excess = _ethSent.sub(_totalCost);
        _buyer.transfer(excess);
        // Track ownership of token holders - only if this is the first time the user is buying these player shares
        if (balanceOf(_buyer) == 0) {
            tokenHolders.push(_buyer);
            addressToTokenHolderIndex[_buyer] = tokenHolders.length - 1;
        }
        // Provide users with the shares
        _allocatePlayerTokensTo(_buyer, _amount);
        // Track costs
        totalCost[_buyer] = totalCost[_buyer] + int256(_totalCost); // No need for safe maths here, just holds profit tracking
        // Event tracking
        emit PlayerTokenBuy(_buyer, _referredBy, _amount, _totalCost, symbol);
    }
}