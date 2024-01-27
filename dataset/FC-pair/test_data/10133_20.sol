contract c10133{
	/**
	 * @notice Send _amount amount of tokens to address _to
	 */
	function transfer(address _to, uint256 _amount) public notTimeLocked stopInEmergency returns (bool success) {
		if (balances[msg.sender] < _amount) {
			error('transfer: the amount to transfer is higher than your token balance');
			return false;
		}
		if(!SCComplianceService.validate(msg.sender, _to, _amount)) {
			error('transfer: not allowed by the compliance service');
			return false;
		}
		balances[msg.sender] = balances[msg.sender].sub(_amount);
		balances[_to] = balances[_to].add(_amount);
		emit Transfer(msg.sender, _to, _amount); // Event log
		return true;
	}
}