contract c2294{
  /// @notice Adds the minter role to provided address
  /// @dev Requires owner role to interact
  /// @param _who is address to add role
  /// @return A boolean that indicates if the operation was successful.
  function addMinter(address _who) public onlyOwner returns (bool) {
    _setMinter(_who, true);
  }
}