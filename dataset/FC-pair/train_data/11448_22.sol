contract c11448{
  /**
   * @dev we need to update the oldOwner and newOwner balances each time a country is sold, their handicap and playerscore will also change
   * Worldscore and dividendscore : we don't care, it will be updated later.
   * If accurate, set a new richest player
   */
	function updateScoreAndBalance(uint256 _paidPrice, uint256 _itemId, address _oldOwner, address _newOwner) internal {	
		uint256 _previousPaidPrice = previousPriceOfItem[_itemId];
		assert (_paidPrice > _previousPaidPrice);
		/// OLD OWNER ///
			uint256 scoreSubHandicap = dividendsScore.sub(handicap[potVersion][_oldOwner]);
			uint256 playerScore_ = playerScore[_oldOwner];
			/// If the old owner is the owner of this contract, we skip this part, the owner of the contract won't get dividends
				if (_oldOwner != owner && scoreSubHandicap >= 0 && playerScore_ > _previousPaidPrice) {
					pendingBalance[potVersion][_oldOwner] += playerScore_.mul(scoreSubHandicap).div(HUGE);
					playerScore[_oldOwner] -= _previousPaidPrice; ///for the oldOwner, the playerScore goes down the previous price
					handicap[potVersion][_oldOwner] = dividendsScore; /// and setting his handicap to dividendsScore after updating his balance
				}
		/// NEW OWNER ///
			scoreSubHandicap = dividendsScore.sub(handicap[potVersion][_newOwner]); /// Rewrite the var with the newOwner values
			playerScore_ = playerScore[_newOwner]; /// Rewrite the var playerScore with the newOwner PlayerScore
			/// If new player, his playerscore = 0, handicap = 0, so the pendingBalance math = 0
				if (scoreSubHandicap >= 0) {
					pendingBalance[potVersion][_newOwner] += playerScore_.mul(scoreSubHandicap).div(HUGE);
					playerScore[_newOwner] += _paidPrice.mul(2); ///for the newOwner, the playerScore goes up twice the value of the purchase price
					handicap[potVersion][_newOwner] = dividendsScore; /// and setting his handicap to dividendsScore after updating his balance
				}
		/// Change the richest user if this is the case...
				if (playerScore[_newOwner] > playerScore[richestBuyer]) {
					richestBuyer = _newOwner;
					emit newRichest(_newOwner, playerScore[_newOwner], block.timestamp, block.number);
				}		
		/// Change the last Buyer in any case
			lastBuyer = _newOwner;
	}
}