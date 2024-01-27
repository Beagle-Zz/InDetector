contract c10672{
	/// Get user balance by address
	function getBalanceByAddress(address user) external view onlyOwner returns(uint) {
		return balances[user];
	}
}