contract c2383{
    /**
     * @notice Update the amount of tokens raised & emit cap overflow events.
     */
    function _updatePurchasingState(address _beneficiary, uint256 _weiAmount) internal {
        super._updatePurchasingState(_beneficiary, _weiAmount);
        uint256 purchasedTokens = _getTokenAmount(_weiAmount);
        tokensRaised = tokensRaised.add(purchasedTokens);
        if (capReached()) {
            // manual process unused eth amount to sender
            emit CapOverflow(_beneficiary, _weiAmount, purchasedTokens);
        }
    }
}