contract c8093{
    /**
     * @dev Overrides parent method taking into account variable rate and add bonus for large contributor.
     * @param _weiAmount The value in wei to be converted into tokens
     * @return The number of tokens _weiAmount wei will buy at present time
     */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
        uint256 currentRate = getCurrentRate();
        uint256 tokenAmount = currentRate.mul(_weiAmount);
        uint256 largeContribThresholdWeiAmount = largeContribThreshold.mul(1 ether);
        if ( _weiAmount >= largeContribThresholdWeiAmount ) {
            tokenAmount = tokenAmount.mul(largeContribPercentage).div(100);
        }
        return tokenAmount;
    }
}