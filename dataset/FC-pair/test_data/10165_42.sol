contract c10165{
  /**
  * @dev Sets bonuses for USD amounts
  */
  function setBonusesForAmounts(uint128[] amounts, uint32[] values) public onlyOwner {
    require(amounts.length == values.length);
    for (uint i = 0; i + 1 < amounts.length; i++) {
      require(amounts[i] > amounts[i+1]);
    }
    BONUS_AMOUNTS = amounts;
    BONUS_AMOUNTS_VALUES = values;
  }
}