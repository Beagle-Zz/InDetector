contract c2294{
  /// @notice The functional modifier rejects the interaction if contract is finalized
  modifier notFinalized() {
    require(!finalized);
    _;
  }
}