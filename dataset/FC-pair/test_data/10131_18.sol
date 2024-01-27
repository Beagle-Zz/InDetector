contract c10131{
	/**
	 * @notice ICO Smart Contract can call this function for the investor to refund
	 */
	function refund(address _investor) onlyICOContract public returns (bool) {
		if (state != State.Refunding) {
			error('refund: state != State.Refunding');
			return false;
		}
		if (deposited[_investor] == 0) {
			error('refund: no deposit to refund');
			return false;
		}
		uint256 depositedValue = deposited[_investor];
		deposited[_investor] = 0;
		tokensAcquired[_investor] = 0; // tokens should have been returned previously to the ICO
		_investor.transfer(depositedValue);
		emit Refunded(_investor, depositedValue); // Event log
		return true;
	}
}