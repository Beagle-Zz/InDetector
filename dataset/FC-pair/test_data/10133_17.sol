contract c10133{
	// **** MODIFIERS
	// @notice To limit token transfers while timelocked
	modifier notTimeLocked() {
		if (now < timelockEndTime && msg.sender != addressSCICO && msg.sender != addressSCEscrow) {
			error('notTimeLocked: Timelock still active. Function is yet unavailable.');
		} else {
			_;
		}
	}
}