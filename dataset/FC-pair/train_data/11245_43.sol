contract c11245{
  /**
  * @dev Computes bonus based on time of contribution relative to the beginning of crowdsale
  * @return bonus percentage scaled by 10
  */
  function computeTimeBonus() public view returns(uint256) {
    require(now >= startTime); // solium-disable-line security/no-block-members
    for (uint i = 0; i < BONUS_TIMES.length; i++) {
      if (now <= BONUS_TIMES[i]) { // solium-disable-line security/no-block-members
        return BONUS_TIMES_VALUES[i];
      }
    }
    return 0;
  }
}