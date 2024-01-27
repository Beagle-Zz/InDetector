contract c18337{
  /**
   * Destroy tokens from other account
   *
   * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
   *
   * @param _from the address of the sender
   * @param _value the amount of money to burn
   */
  function burnFrom(address _from, uint256 _value) public returns (bool success) {
    require(balances[_from] >= _value);                // Check if the targeted balance is enough
    require(_value <= allowed[_from][msg.sender]);     // Check allowance
    balances[_from] -= _value;                         // Subtract from the targeted balance
    allowed[_from][msg.sender] -= _value;              // Subtract from the sender's allowance
    totalSupply -= _value;                      // Update totalSupply
    outstandingQuarters -= _value;              // Update outstanding quarters
    emit Burn(_from, _value);
    // log rate change
    emit BaseRateChanged(getBaseRate(), tranche, outstandingQuarters, address(this).balance, totalSupply);
    return true;
  }
}