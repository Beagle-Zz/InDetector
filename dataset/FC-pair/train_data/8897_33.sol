contract c8897{
	/**
	 * sets the eruption threshold
	 * @param et the new eruption threshold in seconds
	 * */
	function setEruptionThreshold(uint et) public onlyOwner {
		eruptionThreshold = et;
	}
}