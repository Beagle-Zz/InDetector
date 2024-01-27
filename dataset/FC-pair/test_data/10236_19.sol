contract c10236{
	/// Resume all trading
	function resume() external onlyOwner {
		require(paused == true);
		paused = false;
	}
}