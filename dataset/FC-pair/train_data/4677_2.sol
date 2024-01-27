contract c4677{
	/**
	 * @dev Sets buffer for daily rewards. So user have time to claim it. e.g. 1h = 3600
	 * @param newTime New buffer in seconds
	 **/
	function setWaitingTimeBuffer(uint newTime) public onlyOwner returns (uint _newWaitingTimeBuffer) {
	    waitingTimeBuffer = newTime;
	    return waitingTimeBuffer;
	}
}