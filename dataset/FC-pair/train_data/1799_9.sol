contract c1799{
  /// For querying owner of token
  /// @param _divCardId The tokenID for owner inquiry
  /// @dev Required for ERC-721 compliance.
  function ownerOf(uint _divCardId)
    public
    view
    returns (address owner)
  {
    owner = divCardIndexToOwner[_divCardId];
    require(owner != address(0));
	return owner;
  }
}