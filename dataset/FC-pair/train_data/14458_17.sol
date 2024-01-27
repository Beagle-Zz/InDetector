contract c14458{
	/**
	 * @dev Transfer tokens from one address to another
	 * @param _from address The address which you want to send tokens from
	 * @param _to address The address which you want to transfer to
	 * @param _value uint256 the amount of tokens to be transferred
	 */
	/*Override*/
	function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
		require(_to != address(0));
		require(_value <= allowed[_from][msg.sender]);
		//added due to backwards compatibility reasons
		bytes memory empty;
		if(isContract(_to)) {
			require(transferToContract(_from, _to, _value, empty));
		}
		else {
			require(transferToAddress(_from, _to, _value, empty));
		}
		allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender], _value);
		return true;
	}
}