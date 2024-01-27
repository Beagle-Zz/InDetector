contract c8006{
		/***  Modifiers of the contract ***/
	modifier InitializeChallengeAddress { // We need to initialize first the token contract
		require (initChallenge==true);
		_;
    	}
}