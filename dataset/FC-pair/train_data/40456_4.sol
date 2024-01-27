contract c40456{
	 
	function OwnerCloseContract() external OnlyOwner noEther {
		if ( ! ContractEnabled) {
		    if (ContractDisabledBlock < block.number) {
				if (playersPot == 0) { throw; }
				if ( ! msg.sender.send( playersPot )) { throw; }
				playersPot = 0;
		    }
		} else {
    		ContractEnabled = false;
    		ContractDisabledBlock = block.number+rollLossBlockDelay;
			ContractDisabled(ContractDisabledBlock);
    		feeValue += extraJackpot_;
    		extraJackpot_ = 0;
		}
	}
}