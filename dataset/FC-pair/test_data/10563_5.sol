contract c10563{
	// Get balance of the address provided
    function balanceOf(address _owner) constant public returns (uint256 balance) {
        return balances[_owner];
    }
}