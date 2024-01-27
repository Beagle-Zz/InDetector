contract c7017{
  /**
   * @dev Returns an abbreviated name for NFTokens.
   */
  function symbol()
    external
    view
    returns (string _symbol)
  {
    _symbol = nftSymbol;
  }
}