contract c2383{
    /**
     * @dev Overrides parent method taking into account variable rate (as a percentage).
     * @param _weiAmount The value in wei to be converted into tokens
     * @return The number of tokens _weiAmount wei will buy at present time.
     */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
        uint256 currentTierRate = getCurrentTierRatePercentage();
        uint256 requestedTokenAmount = _weiAmount.mul(rate).mul(currentTierRate).div(100);
        uint256 remainingTokens = tokenCap.sub(tokensRaised);
        // Return number of LPC to provide
        if (requestedTokenAmount > remainingTokens) {
            return remainingTokens;
        }
        return requestedTokenAmount;
    }
}