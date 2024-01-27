contract c2294{
  /// @notice Overrides finishMinting function from RBACMintableTokenMixin to prevent finishing minting before finalization
  /// @return A boolean that indicates if the operation was successful.
  function finishMinting() internal returns (bool) {
    require(finalized == true);
    require(super.finishMinting());
    return true;
  }
}