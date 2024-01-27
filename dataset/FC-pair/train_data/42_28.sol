contract c42{
	/* Delete Betting Record */
	function deleteBettingRecordForId (Data storage self, uint256 bettingRecordId) internal {
		self.bettingRecordIds.removeElement(bettingRecordId);
	}
}