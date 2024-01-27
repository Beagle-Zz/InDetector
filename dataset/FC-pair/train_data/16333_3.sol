contract c16333{
	/// @notice What is the balance of a particular account?
	function balanceOf(address _owner) constant returns (uint256 balance) {
		return tokenBalanceOf[_owner];
	}
}