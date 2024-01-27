contract c40266{
	 
	function BuyTicket(uint8 Number1, uint8 Number2, uint8 Number3) noContract OnlyEnabled {
		var Numbers = [Number1 , Number2 , Number3];
		if ( ! checkNumbers( Numbers )) { throw; }
		Numbers = sortNumbers(Numbers);
		if (msg.value < ticketPrice) { throw; }
		if (msg.value-ticketPrice > 0) { if ( ! msg.sender.send( msg.value-ticketPrice )) { throw; } }
		if (currentJackpot == 0) { throw; }
		if (games[currentGame].endTimestamp < now) { throw; }
		ticketCounter++;
		games[currentGame].ticketsCount++;
		bytes32 hash0 = sha3( Numbers[0], Numbers[1], Numbers[2] );
		bytes32 hash1 = sha3( Numbers[0], Numbers[1]);
		bytes32 hash2 = sha3( Numbers[0], Numbers[2]);
		bytes32 hash3 = sha3( Numbers[1], Numbers[2]);
		games[currentGame].hit3Hash[hash0]++;
		games[currentGame].hit2Hash[hash1]++;
		games[currentGame].hit2Hash[hash2]++;
		games[currentGame].hit2Hash[hash3]++;
		players[msg.sender].games[currentGame].numbersBytes.push ( getBytesFromNumbers(Numbers) );
		players[msg.sender].games[currentGame].hit3Hash[hash0]++;
		players[msg.sender].games[currentGame].hit2Hash[hash1]++;
		players[msg.sender].games[currentGame].hit2Hash[hash2]++;
		players[msg.sender].games[currentGame].hit2Hash[hash3]++;
		NewTicketEvent( msg.sender, Numbers[0], Numbers[1], Numbers[2] );
	}
}