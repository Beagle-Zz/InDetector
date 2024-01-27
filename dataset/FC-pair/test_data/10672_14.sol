contract c10672{
	/// Withdraw the user balance in the contract to the user address.
	function withdraw() external returns (bool) {
		uint amount = balances[msg.sender];
		require(amount > 0);
		balances[msg.sender] = 0;
		if(!msg.sender.send(amount)) {
			balances[msg.sender] = amount;
			return false;
		}
		return true;
	}
}