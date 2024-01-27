contract c2294{
  /// @notice Finalizes contract
  /// @dev Requires owner role to interact
  /// @return A boolean that indicates if the operation was successful.
  function finalize() public notFinalized onlyOwner returns (bool) {
    finalized = true;
    emit Finalize();
    return true;
  }
}