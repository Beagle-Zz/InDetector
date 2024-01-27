contract c10165{
  /**
  * @dev Retrieve length of bonuses by time array
  * @return Bonuses by time array length
  */
  function bonusesForTimesCount() public view returns(uint) {
    return BONUS_TIMES.length;
  }
}