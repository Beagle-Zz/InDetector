contract c13076{
    /**
     * @dev Overrides parent method taking into account variable rate.
     * @param _weiAmount The value in wei to be converted into tokens
     * @return The number of tokens _weiAmount wei will buy at present time
     */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256)
    {
        uint256 currentRate = getCurrentRate();
        uint256 volumeBonus = _getVolumeBonus(currentRate, _weiAmount);
        return currentRate.mul(_weiAmount).add(volumeBonus);
    }
}