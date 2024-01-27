contract c10237{
  /**
   * @dev to check the dealer is solvent or not
   * @param choice indicate which team user choose
   * @param amount indicate how many ether user bet
   */
  function isSolvent(uint choice, uint amount) internal view returns (bool) {
    uint needAmount;
    if (choice == 1) {
      needAmount = (leftAmount.add(amount)).mul(betInfo.leftOdds).div(100);
    } else if (choice == 2) {
      needAmount = (middleAmount.add(amount)).mul(betInfo.middleOdds).div(100);
    } else {
      needAmount = (rightAmount.add(amount)).mul(betInfo.rightOdds).div(100);
    }
    if (needAmount.add(getRefundTxFee()) > totalBetAmount.add(amount).add(betInfo.deposit)) {
      return false;
    } else {
      return true;
    }
  }
}