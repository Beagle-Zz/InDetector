contract c10131{
	/**
	 * @notice Must be called by owner before or after ICO ends, to check whether soft cap is reached and transfer collected funds
	 */
	function finalize(bool _forceRefund) onlyOwner public returns (bool) {
		if (isFinalized) {
			error('finalize: ICO is already finalized.');
			return false;
		}
		if (weisRaised >= weisSoftCap && !_forceRefund) {
			if (!SCRefundVault.close()) {
				error('finalize: SCRefundVault.close() failed');
				return false;
			}
		} else {
			if (!SCRefundVault.enableRefunds()) {
				error('finalize: SCRefundVault.enableRefunds() failed');
				return false;
			}
			if(_forceRefund) {
				emit ForceRefund(); // Event log
			}
		}
		// Move remaining ICO tokens back to the Escrow
		uint256 balanceAmount = SCTokens.balanceOf(this);
		if (!SCTokens.transfer(address(SCEscrow), balanceAmount)) {
			error('finalize: unable to return remaining ICO tokens');
			return false;
		}
		// Adjust Escrow balance correctly
		if(!SCEscrow.deposit(balanceAmount)) {
			error('finalize: unable to return remaining ICO tokens');
			return false;
		}
		isFinalized = true;
		emit Finalized(); // Event log
		return true;
	}
}