contract c10579{
  /// @dev Unpauses the smart contract. Can only be called by the manager,
  /// since one reason we may pause the contract is when manager accounts are compromised.
  /// @notice This is public rather than external so it can be called by derived contracts.
  function unpause() public onlyManager {
    // can't unpause if contract was upgraded
    paused = false;
  }
}