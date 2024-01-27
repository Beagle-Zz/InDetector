contract c16652{
	/// @dev Returns is Main Sale.
    function isMainSale() internal view returns (bool) {
        if (now >= startICO && now < endDate) {
            return true;
        } else {
            return false;
        }
    }
}