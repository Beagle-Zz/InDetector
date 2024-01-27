contract c10672{
	/// @dev Set address withdaw wallet
	/// @param _address The address where the balance will be withdrawn
	function setWithdrawWallet(address _address) external onlyOwner {
		uint balance = balances[withdrawWallet];
		balances[withdrawWallet] = 0; // Set to zero previous address balance
		withdrawWallet = _address;
		// Add the previous balance to the new address
		balances[withdrawWallet] = balance;
	}
}