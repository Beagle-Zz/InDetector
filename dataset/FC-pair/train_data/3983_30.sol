contract c3983{
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
    // Sanity check. This could be removed in the future.
    assert(idToIndex[tokens[_index]] == _index);
    return tokens[_index];
  }
}