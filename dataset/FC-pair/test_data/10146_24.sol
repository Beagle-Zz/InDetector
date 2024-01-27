contract c10146{
	/**
	 * @dev Function that is called either externally or by default payable method
	 *
	 * @param beneficiary who should receive tokens
	 */
	function buyTokens(address beneficiary) public payable {
		require(beneficiary != address(0));
		// amount of ethers sent
		uint256 _value = msg.value;
		// calculate token amount from the ethers sent
		uint256 tokens = calculate(_value);
		// calculate bonus token amount from the ethers sent
		uint256 bonusTokens = calculate(getBonus(_value));
		lockBonus(beneficiary, bonusTokens);
		uint256 _totalTokens = tokens.add(bonusTokens);
		// validate the purchase
		require(isValidPurchase(_value , _totalTokens));
		// update the state to log the sold tokens and raised ethers.
		totalTokenSold = totalTokenSold.add(_totalTokens);
		totalEtherRaised = totalEtherRaised.add(_value);
		etherRaisedPerWallet[msg.sender] = etherRaisedPerWallet[msg.sender].add(_value);
		// transfer tokens from contract balance to beneficiary account. calling ERC20 method
		token.transfer(beneficiary, tokens);
		// log event for token purchase
		TokenPurchase(msg.sender, beneficiary, _value, tokens, now);
	}
}