contract c8716{
  /**
   * @dev Returns NFT ID by its index.
   * @param _index A counter less than `totalSupply()`.
   */
  function tokenByIndex(
    uint256 _index
  )
    external
    view
    returns (uint256)
  {
    require(_index < tokens.length);
    return tokens[_index];
  }
}