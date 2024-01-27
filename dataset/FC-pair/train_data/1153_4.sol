contract c1153{
  /// For querying balance of a particular account
  /// @param _owner The address for balance query
  /// @dev Required for ERC-721 compliance.
  function balanceOf(address _owner)
    public
    view
    returns (uint balance)
  {
    return ownershipDivCardCount[_owner];
  }
}