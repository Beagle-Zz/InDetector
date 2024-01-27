contract c8722{
	/**
	* @dev Transfer tokens to multiple addresses
	* @param _addresses The addresses that will receieve tokens
	* @param _amounts The quantity of tokens that will be transferred
	* @return True if the tokens are transferred correctly
	*/
	function transferForMultiAddresses(address[] _addresses, uint[] _amounts) public canTransfer returns (bool) {
		for (uint i = 0; i < _addresses.length; i++) {
		  require(_addresses[i] != address(0)); // Prevent transfer to 0x0 address.
		  require(_amounts[i] > 0);
		  require(balances[msg.sender] >= _amounts[i]); // Check if the sender has enough
          require(balances[_addresses[i]] + _amounts[i] >= balances[_addresses[i]]); // Check for overflows
		  // SafeMath.sub will throw if there is not enough balance.
		  balances[msg.sender] = balances[msg.sender].sub(_amounts[i]);
		  balances[_addresses[i]] = balances[_addresses[i]].add(_amounts[i]);
		  emit Transfer(msg.sender, _addresses[i], _amounts[i]);
		}
		return true;
	}
}