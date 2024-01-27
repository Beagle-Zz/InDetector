contract c40473{
	 
	function OwnerCloseContract() external OnlyOwner {
		reFund();
		if ( ! ContractEnabled) {
		    if (ContractDisabledBlock < block.number) {
		        uint balance_ = this.balance;
		        for ( uint a=0 ; a < investors.length ; a++ ) {
		            balance_ -= investors[a].balance;
		        }
		        if (balance_ > 0) {
                    if ( ! msg.sender.send(balance_)) { throw; }
		        }
		    }
		} else {
    		ContractEnabled = false;
    		ContractDisabledBlock = block.number+rollLossBlockDelay;
    		feeValue += extraJackpot_;
    		extraJackpot_ = 0;
		}
	}
}