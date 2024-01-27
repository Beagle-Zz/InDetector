contract c18888{
  /**
   * @notice Transfers vested tokens to beneficiary.
   */
  function _releaseTo(address target) internal {
    uint256 unreleased = releasableAmount();
    released = released.add(unreleased);
    token.safeTransfer(target, unreleased);
    Released(released);
  }
}