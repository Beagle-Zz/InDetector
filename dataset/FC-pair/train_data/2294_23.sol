contract c2294{
  /// @notice The functional modifier rejects the interaction if contract isn't finalized
  modifier isFinalized() {
    require(finalized);
    _;
  }
}