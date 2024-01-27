contract c3697{
  /**
   * @dev Computes total bonuses amount by value
   * @param _cents deposit amount in USD cents
   * @return total bonus percent (sum of applied bonus percents), bonusIds (sum of applied bonus flags)
   */
  function computeBonuses(uint256 _cents)
    public
    view
    returns (uint256, uint256)
  {
    uint256 bonusTotal;
    uint256 bonusIds;
    for (uint i = 0; i < amountBonuses.length; i++) {
      if (_cents >= amountBonuses[i].amountFrom &&
      _cents <= amountBonuses[i].amountTo) {
        bonusTotal += amountBonuses[i].bonusPercent;
        bonusIds += amountBonuses[i].id;
      }
    }
    return (bonusTotal, bonusIds);
  }
}