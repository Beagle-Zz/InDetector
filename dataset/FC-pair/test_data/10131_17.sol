contract c10131{
	/**
	 * @notice When ICO finalizes owner toggles refunding
	 */
	function enableRefunds() onlyICOContract public returns (bool) {
		if (state != State.Active) {
			error('enableRefunds: state != State.Active');
			return false;
		}
		state = State.Refunding;
		emit RefundsEnabled(); // Event log
		return true;
	}
}