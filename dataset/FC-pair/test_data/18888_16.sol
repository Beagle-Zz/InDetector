contract c18888{
  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   */
  function releasableAmount() public constant returns (uint256) {
    return vestedAmount().sub(released);
  }
}