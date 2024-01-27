contract c18993{
	// TO CALL THIS FUNCTION EASILY, SEND A 0 ETHER TRANSACTION TO THIS CONTRACT WITH EXTRA DATA: 0x7a09588b
	function cashoutEOSBetStakeTokens_ALL() public {
		// just forward to cashoutEOSBetStakeTokens with input as the senders entire balance
		cashoutEOSBetStakeTokens(balances[msg.sender]);
	}
}