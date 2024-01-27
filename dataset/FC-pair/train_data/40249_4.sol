contract c40249{
	 
	function accountFor (address accountOwner, bool createNew) private returns (DaoAccount) {
		DaoAccount account = daoAccounts[accountOwner];
		if(account == DaoAccount(0x00) && createNew) {
			account = new DaoAccount(accountOwner, tokenPrice, challengeOwner);
			daoAccounts[accountOwner] = account;
			notifyNewAccount(accountOwner, address(account));
		}
		return account;
	}
}