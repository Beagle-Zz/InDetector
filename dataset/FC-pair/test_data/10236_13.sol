contract c10236{
	/// Get new price
	function getPrice(uint price) public pure returns (uint) {
		return uint(int(price) + ((int(price) * BUY_INCREASE) / 100));
	}
}