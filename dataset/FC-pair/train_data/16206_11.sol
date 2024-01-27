contract c16206{
	/// @notice  Send _value amount of metadollars from address _from to address _to
	/// @notice  The transferFrom method is used for a withdraw workflow, allowing contracts to send
	/// @notice  tokens on your behalf, for example to "deposit" to a contract address and/or to charge
	/// @notice  fees in sub-currencies; the command should fail unless the _from account has
	/// @notice  deliberately authorized the sender of the message via some mechanism; we propose
	/// @notice  these standardized APIs for approval:
	function transferFrom(address _from,	address _to,	uint256 _value) returns (bool success) {
		assert(msg.sender != address(0));
		assert(_from != address(0));
		assert(_to != address(0));
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[_from]);
		require(!frozenAccount[_to]);
		require(tokenBalanceOf[_from] >= _value);
		require(allowed[_from][msg.sender] >= _value);
		require(tokenBalanceOf[_from] - _value < tokenBalanceOf[_from]);
		require(tokenBalanceOf[_to] + _value > tokenBalanceOf[_to]);
		require(_value > 0);
		orderToTransfer(msg.sender, _from, _to, _value, "Order to transfer metadollars from allowed account");
		_transfer(_from, _to, _value);
		allowed[_from][msg.sender] -= _value;
		return true;
	}
}