contract c12463{
    /**
     * @dev Override to extend the way in which ether is converted to tokens.
     * @param _weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function _getTokenAmount(uint256 _weiAmount)
    internal view returns (uint256)
    {
        // returns $0.01 ETH wei * rate
        uint256 ethCent = fContract.USD(0) * rate;
        return _weiAmount.div(ethCent);
    }
}