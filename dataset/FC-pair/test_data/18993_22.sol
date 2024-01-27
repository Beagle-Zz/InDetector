contract c18993{
	////////////////////////////////////
	// OWNER ONLY FUNCTIONS
	////////////////////////////////////
	// WARNING!!!!! Can only set this function once!
	function setBankrollerContractOnce(address bankrollAddress) public {
		// require that BANKROLLER address == 0 (address not set yet), and coming from owner.
		require(msg.sender == OWNER && BANKROLLER == address(0));
		// check here to make sure that the bankroll contract is legitimate
		// just make sure that calling the bankroll contract getBankroll() returns non-zero
		require(EOSBetBankrollInterface(bankrollAddress).getBankroll() != 0);
		BANKROLLER = bankrollAddress;
	}
}