contract c10131{
	/**
	 * @notice This is out of ERC20 standard but it is necessary to build market escrow contracts of assets
	 * @notice Send _amount amount of tokens to from tx.origin to address _to
	 */
	function refundTokens(address _from, uint256 _amount) public notTimeLocked stopInEmergency returns (bool success) {
        if (tx.origin != _from) {
            error('refundTokens: tx.origin did not request the refund directly');
            return false;
        }
        if (addressSCICO != msg.sender) {
            error('refundTokens: caller is not the current ICO address');
            return false;
        }
        if (balances[_from] < _amount) {
            error('refundTokens: the amount to transfer is higher than your token balance');
            return false;
        }
        if(!SCComplianceService.validate(_from, addressSCICO, _amount)) {
			error('transfer: not allowed by the compliance service');
			return false;
		}
		balances[_from] = balances[_from].sub(_amount);
		balances[addressSCICO] = balances[addressSCICO].add(_amount);
		emit Transfer(_from, addressSCICO, _amount); // Event log
		return true;
	}
}