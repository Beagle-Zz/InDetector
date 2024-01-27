contract c16075{
	/// @notice Check if ICO is ended
	function checkIcoStatus() internal {
		if(tokenBalanceOf[this] <= _totalSupply - icoLimit) {
			icoIsRunning = false;
		}
	}
}