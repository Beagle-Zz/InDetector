contract c7903{
  /// @dev Override unpause so it requires all external contract addresses
  ///  to be set before contract can be unpaused. Also, we can't have
  ///  newContractAddress set either, because then the contract was upgraded.
  /// @notice This is public rather than external so we can call super.unpause
  ///  without using an expensive CALL.
  function unpause() public onlyOwner whenPaused {
    require(newContractAddress == address(0));
    // Actually unpause the contract.
    super.unpause();
  }
}