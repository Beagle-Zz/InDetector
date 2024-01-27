contract c10133{
	/**
	 * @notice Withdraw funds from the tokens contract
	 */
	function fundICO(uint256 _amount, uint8 _stage) public returns (bool) {
		if(nextStage !=_stage) {
			error('Escrow: ICO stage already funded');
			return false;
		}
		if (msg.sender != addressSCICO || tx.origin != owner) {
			error('Escrow: not allowed to fund the ICO');
			return false;
		}
		if (deposited[this]<_amount) {
			error('Escrow: not enough balance');
			return false;
		}
		bool success = SCTokens.transfer(addressSCICO, _amount);
		if(success) {
			deposited[this] = deposited[this].sub(_amount);
			nextStage++;
			emit FundICO(addressSCICO, _amount);
		}
		return success;
	}
}