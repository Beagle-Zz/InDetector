contract c8132{
    /**
     * @dev Calculate amount of tokens.
     * @param _weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function getTokenAmount(uint256 _weiAmount) internal pure returns (uint256) {
        return _weiAmount.mul(RATE);
    }
}