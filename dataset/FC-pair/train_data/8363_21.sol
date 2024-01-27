contract c8363{
  /**
  * @dev mint required amount of token
  * @param _investor address of investor
  * @param _value token amount corresponding to investor
  */
  function mint(address _investor, uint256 _value) onlyOwner whenNotPaused returns (bool success){
		require(_value > 0);
		require(totalSupply.add(_value) <= INITIAL_SUPPLY);
    	balances[_investor] = balances[_investor].add(_value);
		totalSupply = totalSupply.add(_value);
	 	emit Transfer(0x0, _investor, _value);
		return true;
	}
}