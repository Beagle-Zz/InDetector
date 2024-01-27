contract c13763{
	/// @dev calculate next price 
	function calcNextPrice (uint _price) public pure returns (uint nextPrice) {
		if (_price >= 5 ether ) {
			return safeDiv(safeMul(_price, 110), 100);
		} else if (_price >= 2 ether ) {
			return safeDiv(safeMul(_price, 120), 100);
		} else if (_price >= 500 finney ) {
			return safeDiv(safeMul(_price, 130), 100);
		} else if (_price >= 20 finney ) {
			return safeDiv(safeMul(_price, 140), 100);
		} else {
			return safeDiv(safeMul(_price, 200), 100);
		}
	}
}