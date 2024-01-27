contract c12424{
    /** @dev Function from which everyone can bet 
      * @param oddOrEven The number on which the participant want to bet (it is 1 - ODD or 2 - EVEN).
      * @param betsAmount The amount of tickets the participant want to buy.
      * @return success Is the bet successful.
      */
    function bet(uint8 oddOrEven, uint256 betsAmount) public payable returns (bool _success) {
		require(betsAmount > 0);
		uint256 participantBet = betsAmount.mul(BET);
		require(msg.value == participantBet);
        require(oddOrEven == ODD || oddOrEven == EVEN);
        require(block.number <= _endBetBlock && block.number >= _startBetBlock);
		// @dev - check if participant already betted
		if (participants[msg.sender].isParticipated == false) {
			// create new participant in memory
			Participant memory newParticipant;
			newParticipant.isParticipated = true;
			//save the participant to state
			participants[msg.sender] = newParticipant;
			emit LogNewParticipant(msg.sender);
		}
		uint256 betTillNowODD = participants[msg.sender].bets[_targetBlock].ODDBets;
		uint256 betTillNowEVEN = participants[msg.sender].bets[_targetBlock].EVENBets;
		if(oddOrEven == ODD) {
			betTillNowODD = betTillNowODD.add(participantBet);
		} else {
			betTillNowEVEN = betTillNowEVEN.add(participantBet);
		}
		Bet memory newBet = Bet({ODDBets : betTillNowODD, EVENBets: betTillNowEVEN, isRevenuePaid : false});
        //save the bet
        participants[msg.sender].bets[_targetBlock] = newBet;
        // save the bet for the block
        oddAndEvenBets[_targetBlock][oddOrEven] = oddAndEvenBets[_targetBlock][oddOrEven].add(msg.value);
        address(moneyManager).transfer(msg.value);
        emit LogBet(msg.sender, _targetBlock, oddOrEven, msg.value);
        return true;
    }
}