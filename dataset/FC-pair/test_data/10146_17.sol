contract c10146{
	/**
	 * @dev Function that is called either externally or by default payable method
	 *
	 * @param beneficiary who should receive tokens
	 */
	function buyTokens(address beneficiary) public payable {
		require(beneficiary != address(0));
		// amount of ethers sent
		uint256 value = msg.value;
		// calculate token amount from the ethers sent
		uint256 tokens = calculate(value);
		// validate the purchase
		require(isValidPurchase(value , tokens));
		// update the state to log the sold tokens and raised ethers.
		totalTokenSold = totalTokenSold.add(tokens);
		totalEtherRaised = totalEtherRaised.add(value);
		etherRaisedPerWallet[msg.sender] = etherRaisedPerWallet[msg.sender].add(value);
		// transfer tokens from contract balance to beneficiary account. calling ERC223 method
		token.transfer(beneficiary, tokens);
		// log event for token purchase
		TokenPurchase(msg.sender, beneficiary, value, tokens, now);
	}
}