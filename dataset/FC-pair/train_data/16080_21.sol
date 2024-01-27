contract c16080{
	/// @notice Set the current commission rate
	/// @param commissionRateInWei - commission rate
	function setCommissionRate(uint256 commissionRateInWei) isOwner {
		require(commissionRateInWei >= 0);
		commissionRate = commissionRateInWei;
	}
}