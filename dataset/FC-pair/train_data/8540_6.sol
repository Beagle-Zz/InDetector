contract c8540{
  /// @dev Unpauses the smart contract. Can only be called owner.
  /// @notice This is public rather than external so it can be called by
  ///  derived contracts.
  function unpause() public onlyOwner whenPaused {
    // can't unpause if contract was upgraded
    paused = false;
  }
}