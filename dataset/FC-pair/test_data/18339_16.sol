contract c18339{
  /**
   * Destroy tokens
   *
   * Remove `_value` tokens from the system irreversibly
   *
   * @param _value the amount of money to burn
   */
  function burn(uint256 _value) public returns (bool success) {
    require(balances[msg.sender] >= _value);   // Check if the sender has enough
    balances[msg.sender] -= _value;            // Subtract from the sender
    totalSupply -= _value;                     // Updates totalSupply
    outstandingQuarters -= _value;              // Update outstanding quarters
    emit Burn(msg.sender, _value);
    // log rate change
    emit BaseRateChanged(getBaseRate(), tranche, outstandingQuarters, address(this).balance, totalSupply);
    return true;
  }
}