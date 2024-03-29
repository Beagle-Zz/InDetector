contract c12823{
	// sends all the value to the beneficiary
	function withdraw() public {
		// perform validations
		assert(creator == msg.sender || beneficiary == msg.sender); // only creator or beneficiary can initiate this call
		assert(collected >= softCap); // crowdsale must be successful
		assert(this.balance > 0); // there should be something to transfer
		// how much to withdraw (entire balance obviously)
		uint value = this.balance;
		// perform the transfer
		__beneficiaryTransfer(value);
	}
}