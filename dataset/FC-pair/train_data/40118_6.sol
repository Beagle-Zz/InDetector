contract c40118{
	 
	 
	 
	function createAccount () noEther returns (DaoAccount account) {
		address accountOwner = msg.sender;
		address challengeOwner = owner;  
		 
		if(daoAccounts[accountOwner] != DaoAccount(0x00)) throw;
		daoAccounts[accountOwner] = new DaoAccount(accountOwner, challengeOwner);
		return daoAccounts[accountOwner];
	}
}