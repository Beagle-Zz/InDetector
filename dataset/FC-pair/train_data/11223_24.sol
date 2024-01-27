contract c11223{
  /**
  * @dev the total stake
  * @return the total stake
  */
  function totalStake() public view returns (uint256) {
    return totalStake_;
  }
}