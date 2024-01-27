contract c12426{
    /** @dev Function which allows the participants to withdraw their revenue.
      * @param _blockNumber The block for which the participants will withdraw their revenue.
      * @return _success Is the revenue withdrawn successfully.
      */
    function withdrawRevenue(uint256 _blockNumber) public returns (bool _success) {
        require(participants[msg.sender].bets[_blockNumber].ODDBets > 0 || participants[msg.sender].bets[_blockNumber].EVENBets > 0);
        require(participants[msg.sender].bets[_blockNumber].isRevenuePaid == false);
        require(isBlockRevenueCalculated[_blockNumber] == true);
        if (oddAndEvenBets[_blockNumber][ODD] == 0 || oddAndEvenBets[_blockNumber][EVEN] == 0) {
			if(participants[msg.sender].bets[_blockNumber].ODDBets > 0) {
				IMoneyManager(moneyManager).payTo(msg.sender, participants[msg.sender].bets[_blockNumber].ODDBets);
			}else{
				IMoneyManager(moneyManager).payTo(msg.sender, participants[msg.sender].bets[_blockNumber].EVENBets);
			}
            participants[msg.sender].bets[_blockNumber].isRevenuePaid = true;
            emit LogpayToRevenue(msg.sender, _blockNumber, participants[msg.sender].bets[_blockNumber].isRevenuePaid);
            return participants[msg.sender].bets[_blockNumber].isRevenuePaid;
        }
        // @dev - initial revenue to be paid
        uint256 _revenue = 0;
        uint256 counter = 0;
		uint256 totalPayment = 0;
        if (blockResult[_blockNumber] == ODD) {
			counter = (participants[msg.sender].bets[_blockNumber].ODDBets).div(BET);
            _revenue = _revenue.add(blockRevenuePerTicket[_blockNumber].mul(counter));
        } else if (blockResult[_blockNumber] == EVEN) {
			counter = (participants[msg.sender].bets[_blockNumber].EVENBets).div(BET);
           _revenue = _revenue.add(blockRevenuePerTicket[_blockNumber].mul(counter));
        }
		totalPayment = _revenue.add(BET.mul(counter));
        // pay the revenue
        IMoneyManager(moneyManager).payTo(msg.sender, totalPayment);
        participants[msg.sender].bets[_blockNumber].isRevenuePaid = true;
        emit LogpayToRevenue(msg.sender, _blockNumber, participants[msg.sender].bets[_blockNumber].isRevenuePaid);
        return participants[msg.sender].bets[_blockNumber].isRevenuePaid;
    }
}