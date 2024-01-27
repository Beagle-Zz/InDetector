contract c2861{
  /**
   * @dev Calculates the amount that has already vested.
   */
  function vestedAmount(address _beneficiary) public view returns (uint256) {
    tokenToVest storage value = vestToMap[_beneficiary];
    //uint256 currentBalance = balanceOf(_beneficiary);
    uint256 totalBalance = value.torelease;
    if (block.timestamp < value.cliff) {
      return 0;
    } else if (block.timestamp >= value.start.add(value.duration)) {
      return totalBalance;
    } else {
      return totalBalance.mul(block.timestamp.sub(value.start)).div(value.duration);
    }
  }
}