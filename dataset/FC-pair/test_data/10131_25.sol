contract c10131{
	/**
	 * @notice Token purchase function direclty through ICO Smart Contract. Beneficiary = msg.sender
	 */
	function buyTokens() public stopInEmergency payable returns (bool) {
		if (msg.value == 0) {
			error('buyTokens: ZeroPurchase');
			return false;
		}
		uint256 tokenAmount = buyTokensLowLevel(msg.sender, msg.value);
		// Send the investor's ethers to the vault
		if (!SCRefundVault.deposit.value(msg.value)(msg.sender, tokenAmount)) {
			revert('buyTokens: unable to transfer collected funds from ICO contract to Refund Vault'); // Revert needed to refund investor on error
			// error('buyTokens: unable to transfer collected funds from ICO contract to Refund Vault');
			// return false;
		}
		emit BuyTokens(msg.sender, msg.value, tokenAmount); // Event log
		return true;
	}
}