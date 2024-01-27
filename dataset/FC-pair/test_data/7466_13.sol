contract c7466{
  /**
   * @dev Returns the number locks of the provided _beneficiary.
   * @param _beneficiary Address owning the locks.
   */
  function getTokenTimelockCount(address _beneficiary) view external returns (uint) {
    return tokenTimeLocks[_beneficiary].length;
  }
}