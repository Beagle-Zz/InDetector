contract c13747{
  /**
   * @dev Override to extend the way in which ether is converted to tokens.
   * @param _weiAmount Value in wei to be converted into tokens
   * @return Number of tokens that can be purchased with the specified _weiAmount
   */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
		uint256 _tokens = ((_weiAmount/weiPerToken) * 1e18);
        return (_tokens);
    }
}