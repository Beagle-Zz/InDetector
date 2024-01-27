contract c7017{
  /**
   * @dev Returns a descriptive name for a collection of NFTokens.
   */
  function name()
    external
    view
    returns (string _name)
  {
    _name = nftName;
  }
}