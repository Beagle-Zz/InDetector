contract c8013{
	/***  Functions of the contract ***/
	function InitPeculiumAdress(address peculAdress) public onlyOwner 
	{ // We init the address of the token
		pecul = Peculium(peculAdress);
		decimals = pecul.decimals();
		initPecul = true;
		emit InitializedToken(peculAdress);
	}
}