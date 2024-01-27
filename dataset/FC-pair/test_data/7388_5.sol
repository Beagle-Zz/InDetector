contract c7388{
	/**
	 * @dev Allows the owner to withdraw the token funds.
	 */
	function withdraw() public onlyOwner {
		uint256 balance = token.balanceOf(address(this));
		uint256 hundred = 100;
		uint256 brokerWithdraw = (balance.div(hundred)).mul(commission);
		uint256 beneficiaryWithdraw = balance.sub(brokerWithdraw);
		token.transfer(beneficiary, beneficiaryWithdraw);
		token.transfer(broker, brokerWithdraw);
		emit Withdrawn(balance);
	}
}