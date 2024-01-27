contract c10237{
  /**
   * @dev update this bet some state
   * @param choice indicate which team user choose
   * @param amount indicate how many ether user bet
   */
  function updateAmountOfEachChoice(uint choice, uint amount) internal {
    if (choice == 1) {
      leftAmount = leftAmount.add(amount);
    } else if (choice == 2) {
      middleAmount = middleAmount.add(amount);
    } else {
      rightAmount = rightAmount.add(amount);
    }
  }
}