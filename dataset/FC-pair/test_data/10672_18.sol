contract c10672{
	/// Pause the game preventing any buys
	/// This will only be done to award the cup
	/// The game will automatically stops purchases during
	/// the tournament final
	function pause() external onlyOwner {
		require(paused == false);
		paused = true;
	}
}