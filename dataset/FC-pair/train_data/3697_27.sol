contract c3697{
  /**
   * @dev Calculates and applies bonuses and implements actual token transfer and events
   * @param _investor address of the beneficiary receiving tokens
   * @param _cents amount of deposit in cents
   */
  function buyTokens(address _investor, uint256 _cents) internal {
    (uint256 bonusPercent, uint256 bonusIds) = computeBonuses(_cents);
    uint256 tokens = computeTokens(_cents);
    require(tokens > 0, "value is not enough");
    token.transfer(_investor, tokens);
    centsRaised = centsRaised.add(_cents);
    tokensSold = tokensSold.add(tokens);
    emit TokenPurchase(
      _investor,
      priceOracle.ethPriceInCents(),
      _cents,
      bonusPercent,
      bonusIds
    );
  }
}