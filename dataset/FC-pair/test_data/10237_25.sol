contract c10237{
  /**
   * @dev fetch bets use category
   * @param category Indicate the sports events type
   */
  function getBetsByCategory(bytes32 category) view public returns (Bet[]) {
    return bets[category];
  }
}