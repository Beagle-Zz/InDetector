contract c10133{
	/**
	 * @notice Send _amount amount of tokens from address _from to address _to
 	 * @notice The transferFrom method is used for a withdraw workflow, allowing contracts to send 
 	 * @notice tokens on your behalf, for example to "deposit" to a contract address and/or to charge 
 	 * @notice fees in sub-currencies; the command should fail unless the _from account has 
 	 * @notice deliberately authorized the sender of the message via some mechanism
 	 */
	function transferFrom(address _from, address _to, uint256 _amount) public notTimeLocked stopInEmergency returns (bool success) {
		if (balances[_from] < _amount) {
			error('transferFrom: the amount to transfer is higher than the token balance of the source');
			return false;
		}
		if (allowed[_from][msg.sender] < _amount) {
			error('transferFrom: the amount to transfer is higher than the maximum token transfer allowed by the source');
			return false;
		}
		if(!SCComplianceService.validate(_from, _to, _amount)) {
			error('transfer: not allowed by the compliance service');
			return false;
		}
		balances[_from] = balances[_from].sub(_amount);
		balances[_to] = balances[_to].add(_amount);
		allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
		emit Transfer(_from, _to, _amount); // Event log
		return true;
	}
}