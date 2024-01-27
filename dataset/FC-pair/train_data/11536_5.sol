contract c11536{
  // ********************************************************************************************************
  // Helper FUNCTIONS
  // ********************************************************************************************************
  // @dev All functions that make our life easier
  // ********************************************************************************************************
 /// For querying balance of a particular account
  /// @param _owner The address for balance query
  /// @dev Required for ERC-721 compliance.
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return ownershipTokenCount[_owner];
  }
}