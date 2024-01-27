contract c10131{
	/**
	 * @notice When ICO finalizes funds are transferred to founders' wallets
	 */
	function close() onlyICOContract public returns (bool) {
		if (state != State.Active) {
			error('close: state != State.Active');
			return false;
		}
		state = State.Closed;
		walletFounder1.transfer(address(this).balance.mul(33).div(100)); // Forwards 33% to 1st founder wallet
		walletFounder2.transfer(address(this).balance.mul(50).div(100)); // Forwards 33% to 2nd founder wallet
		walletFounder3.transfer(address(this).balance);                  // Forwards 34% to 3rd founder wallet
		emit Closed(); // Event log
		return true;
	}
}