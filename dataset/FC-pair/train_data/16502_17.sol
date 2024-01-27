contract c16502{
	// creates the token to be sold.
	// override this method to have crowdsale of a specific mintable token.
	function createTokenContract() internal returns (MintableToken) {
		return new MintableToken();
	}
}