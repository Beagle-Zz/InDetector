contract c7165{
	// ---------------------------
	//  Public (player) functions
	// ---------------------------
	function register() public beforeDeadline returns (bool success){		
		// players may register only once
		require(players[msg.sender].status == 0);		
		// update player status
		players[msg.sender].status = 1;
		players[msg.sender].teamPrice = 0;
		registrations.push(msg.sender);
		// Broadcast event of player registration
		emit NewPlayer(msg.sender);
		// sent 100 DIIP to contract caller
		return transferPlayerBudget(msg.sender);		
	}
}