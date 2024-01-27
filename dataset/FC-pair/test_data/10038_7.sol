contract c10038{
  /**
   * @dev Provides an internal function for destroying tokens. Useful for upgrades.
   */
  function burnTokens(address account, uint value) internal {
    balances[account] = balances[account].sub(value);
    total_supply = total_supply.sub(value);
    emit Transfer(account, 0, value);
    emit Burned(account, value);
  }
}