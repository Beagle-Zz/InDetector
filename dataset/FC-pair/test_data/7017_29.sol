contract c7017{
  /**
   * @dev Returns the count of all existing NFTokens.
   */
  function totalSupply()
    external
    view
    returns (uint256)
  {
    return tokens.length;
  }
}