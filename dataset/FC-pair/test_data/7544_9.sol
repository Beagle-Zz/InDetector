contract c7544{
	/// @param _owner The address from which the balance will be retrieved
    /// @return The balance
    function getBalanceOf(address _owner) public constant returns (uint256 balance) {
		 return balanceOf[_owner];
	}
}