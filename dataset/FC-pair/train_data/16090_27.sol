contract c16090{
  /**
   * @dev Burns a specific amount of tokens assigned to a given address
   * @param _burner The owner of the tokens to be burned
   * @param _value The amount of token to be burned
   * @return True if the operation was successful.
   */
  function burn(address _burner, uint256 _value) public onlyManagement returns (bool) {
    require(_value <= balances[_burner]);
    balances[_burner] = balances[_burner].minus(_value);
    totalSupply_ = totalSupply_.minus(_value);
    emit Burn(_burner, _value);
    return true;
  }
}