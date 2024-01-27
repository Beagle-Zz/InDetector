contract c16927{
  /**
   * @dev Function to burn tokens
   * @param _value The amount of tokens to be burned.
   * @return A boolean that indicates if the operation was successful.
   */
  function burn(uint256 _value) onlyOwnerOrBurnDelegate public returns (bool) {
    require(_value <= balances[msg.sender]);
    address burner = msg.sender;
    balances[burner] = balances[burner].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    // Call events
    Burn(burner, _value);
    Transfer(burner, address(0), _value);
    return true;
  }
}