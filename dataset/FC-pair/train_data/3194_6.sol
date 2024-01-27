contract c3194{
  /**
   * Burn extra tokens from a balance.
   *
   */
  function burn(uint burnAmount) {
    address burner = msg.sender;
    balances[burner] = balances[burner].sub(burnAmount);
    totalSupply = totalSupply.sub(burnAmount);
    Burned(burner, burnAmount);
    // Inform the blockchain explores that track the
    // balances only by a transfer event that the balance in this
    // address has decreased
    Transfer(burner, BURN_ADDRESS, burnAmount);
  }
}