contract c2294{
  /// @notice Overrides finalize function from RBACERC223TokenFinalization to prevent future minting after finalization
  /// @return A boolean that indicates if the operation was successful.
  function finalize() public returns (bool) {
    require(super.finalize());
    require(finishMinting());
    return true;
  }
}