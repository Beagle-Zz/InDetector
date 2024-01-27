contract c3942{
  /**
   * @notice Terminate contract and refund to owner
   * @notice The called token contracts could try to re-enter this contract. Only
   supply token contracts you trust.
   */
  function destroy() onlyOwner public {
    selfdestruct(owner);
  }
}