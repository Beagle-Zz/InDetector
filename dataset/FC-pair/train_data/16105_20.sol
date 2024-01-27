contract c16105{
	/// @dev Returns is Pre-Sale.
    function isPreSale() internal view returns (bool) {
        if (now >= startDate && now < endPreICO && preIcoCap.sub(stat.currentFundraiser) > 0) {
            return true;
        } else {
            return false;
        }
    }
}