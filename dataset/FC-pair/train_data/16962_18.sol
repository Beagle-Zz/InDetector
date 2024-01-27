contract c16962{
  // Allocate tokens to the users
  // @param _to The owner of the token
  // @param _value The value of the token
  function allocateTokens(address _to, uint256 _value) onlyOwner {
      require(totalSupply.add(_value) > totalSupply);
      require(balances[_to].add(_value) > balances[_to]);
      totalSupply =  totalSupply.add(_value);
      balances[_to] = balances[_to].add(_value);
      emit Transfer(msg.sender, _to, _value);
  }
}