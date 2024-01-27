contract c10131{
	/**
	 * @notice Registers an investor
	 */
	function addInvestor(address _wallet) external isManager returns (bool) {
		// Checks whether this wallet has been previously added as an investor
		if (walletsICO[_wallet]) {
			error('addInvestor: this wallet has been previously granted as ICO investor');
			return false;
		}
		walletsICO[_wallet] = true;
		emit AddInvestor(_wallet, timestamp()); // Event log
		return true;
	}
}