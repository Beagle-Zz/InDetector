contract c16333{
	/// @notice Transfer amount of metadollars from own wallet to someone else
	function transfer(address _to, uint256 _value) returns (bool success) {
		assert(msg.sender != address(0));
		assert(_to != address(0));
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[_to]);
		require(tokenBalanceOf[msg.sender] >= _value);
		require(tokenBalanceOf[msg.sender] - _value < tokenBalanceOf[msg.sender]);
		require(tokenBalanceOf[_to] + _value > tokenBalanceOf[_to]);
		require(_value > 0);
		_transfer(msg.sender, _to, _value);
		return true;
	}
}