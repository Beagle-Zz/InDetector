contract c11175{
	/* @dev Allow Admin to reclaim all unclaim tokens back to the specified wallet */
	function reClaimBalance() public onlyAdmin{
		uint256 taBal = token.balanceOf(this);
		token.transfer(wallet, taBal);
		emit eReClaimToken(taBal, wallet, msg.sender);
	}
}