contract c13946{
    /**
     * @dev low level token purchase ***DO NOT OVERRIDE***
     * @param _beneficiary Address performing the token purchase
     */
    function buyTokens(address _beneficiary) public whenNotPaused payable {
        if ((msg.value >= 500000000000000000000) && (msg.value < 1000000000000000000000)) {
            rate = 7140;
        } else if (msg.value >= 1000000000000000000000) {
            rate = 7650;
        } else if (tokensSold <= 21420000000000000000000000) {
            rate = 6120;
        } else if ((tokensSold > 21420000000000000000000000) && (tokensSold <= 42304500000000000000000000)) {
            rate = 5967;
        } else if ((tokensSold > 42304500000000000000000000) && (tokensSold <= 73095750000000000000000000)) {
            rate = 5865;
        } else if ((tokensSold > 73095750000000000000000000) && (tokensSold <= 112365750000000000000000000)) {
            rate = 5610;
        } else if ((tokensSold > 112365750000000000000000000) && (tokensSold <= 159222000000000000000000000)) {
            rate = 5355;
        } else if (tokensSold > 159222000000000000000000000) {
            rate = 5100;
        }
        uint256 weiAmount = msg.value;
        uint256 tokens = _getTokenAmount(weiAmount);
        _processPurchase(_beneficiary, tokens);
        emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
        _updatePurchasingState(_beneficiary, weiAmount);
        _forwardFunds();
        _postValidatePurchase(_beneficiary, weiAmount);
        tokensSold = allCrowdSaleTokens.sub(token.balanceOf(this));
    }
}