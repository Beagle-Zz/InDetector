contract c2861{
  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   */
  function releasableAmount(address _beneficiary) public view returns (uint256) {
    return vestedAmount(_beneficiary).sub(vestToMap[_beneficiary].released);
  }
}