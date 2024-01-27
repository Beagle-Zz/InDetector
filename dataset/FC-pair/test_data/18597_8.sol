contract c18597{
	// resets the amount already spent today. needs many of the owners to confirm.
	function resetSpentToday() onlymanyowners(sha3(msg.data)) external {
		m_spentToday = 0;
	}
}