contract c8897{
	/**
	 * sets the protection price
	 * @param price the price in tokens
	 * */
	function setProtectionPrice(uint price) public onlyOwner {
		protectionPrice = price;
	}
}