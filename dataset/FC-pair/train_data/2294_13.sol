contract c2294{
  /// @notice The functional modifier rejects the interaction of senders who are not owners
  modifier onlyOwner() {
    require(isOwner(msg.sender), FORBIDDEN);
    _;
  }
}