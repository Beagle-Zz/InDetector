contract c16883{
  /**
   * @dev Function to burn tokens. We burn as owners redeem tokens (actually the PentacoreRedemptions contract does).
   * @param _amount The amount of tokens to burn.
   * @return A boolean that indicates if the operation was successful.
   */
  function burn(uint256 _amount) public onlyBy(redemption) returns (bool) {
    // Should run even when the token is paused.
    require(balances[redemption].sub(_amount) >= uint256(0));
    require(totalSupply_.sub(_amount) >= uint256(0));
    balances[redemption] = balances[redemption].sub(_amount);
    totalSupply_ = totalSupply_.sub(_amount);
    emit Burn(_amount);
    return true;
  }
}