contract c18990{
	///////////////////////////////////////////////
	// BANKROLL CONTRACT <-> GAME CONTRACTS functions
	/////////////////////////////////////////////// 
	function payEtherToWinner(uint256 amtEther, address winner) public addressInTrustedAddresses(msg.sender){
		// this function will get called by a game contract when someone wins a game
		// try to send, if it fails, then send the amount to the owner
		// note, this will only happen if someone is calling the betting functions with
		// a contract. They are clearly up to no good, so they can contact us to retreive 
		// their ether
		// if the ether cannot be sent to us, the OWNER, that means we are up to no good, 
		// and the ether will just be given to the bankrollers as if the player/owner lost 
		if (! winner.send(amtEther)){
			emit FailedSend(winner, amtEther);
			if (! OWNER.send(amtEther)){
				emit FailedSend(OWNER, amtEther);
			}
		}
	}
}