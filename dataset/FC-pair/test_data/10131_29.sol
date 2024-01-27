contract c10131{
	/**
	 * @notice If ICO is unsuccessful, investors can claim refunds here
	 */
	function claimRefund() public stopInEmergency returns (bool) {
		if (!isFinalized) {
			error('claimRefund: ICO is not yet finalized.');
			return false;
		}
		if (!SCRefundVault.isRefunding()) {
			error('claimRefund: RefundVault state != State.Refunding');
			return false;
		}
		// Before transfering the ETHs to the investor, get back the tokens bought on ICO
		uint256 tokenAmount = SCRefundVault.getTokensAcquired(msg.sender);
		emit GetBackTokensOnRefund(msg.sender, this, tokenAmount); // Event Log
		if (!SCTokens.refundTokens(msg.sender, tokenAmount)) {
			error('claimRefund: unable to transfer investor tokens to ICO contract before refunding');
			return false;
		}
		if (!SCRefundVault.refund(msg.sender)) {
			error('claimRefund: SCRefundVault.refund() failed');
			return false;
		}
		return true;
	}
}