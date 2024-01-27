contract c40389{
	 
	function OwnerCloseContract() external OnlyOwner noEther {
		if ( ! ContractEnabled) {
			if (ContractDisabledBlock < block.number) {
				if (playersPot == 0) { throw; }
				uint _value = playersPot;
				playersPot = 0;
				if ( ! msg.sender.send( _value )) { throw; }
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