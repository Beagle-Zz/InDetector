contract c40473{
	 
	function DoRoll() external {
		reFund();
		uint value_;
		bool found;
		for ( uint a=0 ; a < players[msg.sender].length ; a++ ) {
			if (players[msg.sender][a].valid) {
			    if (players[msg.sender][a].blockNumber+rollLossBlockDelay <= block.number) {
			        uint feeValue_ = players[msg.sender][a].value/2;
			        feeValue += feeValue_;
			        investorAddFee(players[msg.sender][a].value - feeValue_);
					playersPot -= players[msg.sender][a].value;
					delete players[msg.sender][a];
					found = true;
					continue;
			    }
				if ( ! ContractEnabled || jackpot_ == 0 || players[msg.sender][a].game != JackpotHits) {
					value_ += players[msg.sender][a].value;
					playersPot -= players[msg.sender][a].value;
					delete players[msg.sender][a];
					found = true;
					continue;
				}
				if (players[msg.sender][a].blockNumber < block.number) {
					value_ += makeRoll(a);
					playersPot -= players[msg.sender][a].value;
					delete players[msg.sender][a];
					found = true;
					continue;
				}
			}
		}
		if (value_ > 0) { if (msg.sender.send(value_)) { throw; } }
		if ( ! found) { throw; }
	}
}