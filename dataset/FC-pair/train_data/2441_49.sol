contract c2441{
    /**
     * @dev Override to extend the way in which ether is converted to tokens.
     * @param _weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function _getTokenAmount(uint256 _weiAmount)
        internal view returns (uint256)
    {
        uint256 bonusRate = getBonusRate(_weiAmount);
        return _weiAmount.mul(bonusRate).div(1 ether);
    }
}