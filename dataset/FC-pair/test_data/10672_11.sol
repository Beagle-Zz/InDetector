contract c10672{
	///	Buy a country
	///	@param id - The country id
	function buy(uint8 id) external payable buyAvailable unlocked {
		require(id < 32);
		uint price = getPrice(countries[id].price);
		require(msg.value > startPrice);
		require(msg.value >= price);
		uint fee = msg.value.mul(DEV_FEE).div(100);
		// Add sell price minus fees to previous country owner
		balances[countries[id].owner] += msg.value.sub(fee);
		// Add fee to developers balance
		balances[withdrawWallet] += fee;
		// Set new owner, with new message
		countries[id].owner = msg.sender;
		countries[id].price = msg.value;
		// Trigger buy event
		emit Buy(msg.sender, id, msg.value);
	}
}