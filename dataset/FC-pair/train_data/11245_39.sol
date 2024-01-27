contract c11245{
  /**
  * @dev Retrieve length of bonuses by amounts array
  * @return Bonuses by amounts array length
  */
  function bonusesForAmountsCount() public view returns(uint) {
    return BONUS_AMOUNTS.length;
  }
}