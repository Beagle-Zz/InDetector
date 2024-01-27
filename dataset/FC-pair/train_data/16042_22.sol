contract c16042{
	/// @notice 'freeze? Prevent | Allow' 'account' from sending and receiving tokens
	/// @param account - address to be frozen
	/// @param freeze - select is the account frozen or not
	function freezeAccount(address account, bool freeze) isOwner {
		require(account != owner);
		require(account != supervisor);
		frozenAccount[account] = freeze;
		if(freeze) {
			FrozenFunds(msg.sender, account, "Account set frozen!");
		}else {
			FrozenFunds(msg.sender, account, "Account set free for use!");
		}
	}
}