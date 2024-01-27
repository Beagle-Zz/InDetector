contract c10672{
	/// Resume all trading
	function resume() external onlyOwner {
		require(paused == true);
		paused = false;
	}
}