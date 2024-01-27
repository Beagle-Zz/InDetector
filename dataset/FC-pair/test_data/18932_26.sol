contract c18932{
	/**
	 * sets the fee to charge on each purchase
	 * @param _fee the new fee
	 * */
	function setFee(uint8 _fee) public onlyOwner {
		fee = _fee;
	}
}