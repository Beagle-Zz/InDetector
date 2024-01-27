contract c10415{
  /**
   * @dev get the bet numbers of a specific choice
   * @param choice indicate the choice
   */
  function getNumberByChoice(uint choice) view public returns (uint) {
    return numberOfChoice[choice];
  }
}