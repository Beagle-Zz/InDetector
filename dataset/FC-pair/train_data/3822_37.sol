contract c3822{
    /**
     * @dev Overrides parent method taking into account variable rate.
     * @param _weiAmount The value in wei to be converted into tokens
     * @return The number of tokens _weiAmount wei will buy at present time
     */
    function _getTokenAmount(uint256 _weiAmount)
    internal view returns(uint256)
    {
        for (uint i = 0; i < thresholds.length; i++)
        {
            if (_weiAmount >= thresholds[i])
            {
                return _weiAmount.mul(rate.mul(100 + bonuses[i]).div(100));
            }
        }
        return _weiAmount.mul(rate);
    }
}