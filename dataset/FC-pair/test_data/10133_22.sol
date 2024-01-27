contract c10133{
	/**
	 * @notice Allow _spender to withdraw from your account, multiple times, up to the _amount amount. 
 	 * @notice If this function is called again it overwrites the current allowance with _amount.
	 */
	function approve(address _spender, uint256 _amount) public returns (bool success) {
		allowed[msg.sender][_spender] = _amount;
		emit Approval(msg.sender, _spender, _amount); // Event log
		return true;
	}
}