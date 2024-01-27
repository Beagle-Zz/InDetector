contract c8716{
  /**
   * @dev returns the n-th NFT ID from a list of owner's tokens.
   * @param _owner Token owner's address.
   * @param _index Index number representing n-th token in owner's list of tokens.
   */
  function tokenOfOwnerByIndex(
    address _owner,
    uint256 _index
  )
    external
    view
    returns (uint256)
  {
    require(_index < ownerToIds[_owner].length);
    return ownerToIds[_owner][_index];
  }
}