contract c16502{
	// @return true if crowdsale event has ended
	function hasEnded() public view returns (bool) {
		return now > endTime;
	}
}