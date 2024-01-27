contract c2294{
  /// @notice Functional modifier for rejecting the interaction of senders that are not minters
  modifier onlyMinter() {
    require(isMinter(msg.sender), FORBIDDEN);
    _;
  }
}