contract c4945{
    /**
     * @dev Override to extend the way in which ether is converted to tokens.
     * @param _weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function _getTokenAmount(uint _weiAmount) internal view returns (uint) {
        return _weiAmount.mul(10 ** decimals).div(weiPerToken);
    }
}