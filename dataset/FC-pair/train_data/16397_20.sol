contract c16397{
  /**
   * @dev Returns the amount of tokens given for the amount in Wei
   * @param _weiAmount Value in wei
   */
  function getTokenAmount(uint256 _weiAmount) public pure returns (uint256) {
    // Amount in wei (10**18 wei == 1 eth) and the token is 18 decimal places
    return _weiAmount.mul(TOKENS_PER_ETH);
  }
}