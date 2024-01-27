contract c2814{
// ----------------------------------------------------------------------------
// Override to extend the way in which ether is converted to tokens.
// _weiAmount Value in wei to be converted into tokens
// return Number of tokens that can be purchased with the specified _weiAmount
// ----------------------------------------------------------------------------
  function getTokenAmount(uint256 weiAmount)
    internal view returns (uint256)
  {
    return weiAmount.div(rate);
  }
}