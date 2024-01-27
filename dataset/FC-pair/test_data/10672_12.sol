contract c10672{
	///	Buy the cup from previous owner
	function buyCup() external payable buyAvailable cupAvailable {
		uint price = getPrice(cup.price);
		require(msg.value >= price);
		uint fee = msg.value.mul(DEV_FEE).div(100);
		// Add sell price minus fees to previous cup owner
		balances[cup.owner] += msg.value.sub(fee);
		// Add fee to developers balance
		balances[withdrawWallet] += fee;
		// Set new owner, with new message
		cup.owner = msg.sender;
		cup.price = msg.value;
		// Trigger buy event
		emit BuyCup(msg.sender, msg.value);
	}
}