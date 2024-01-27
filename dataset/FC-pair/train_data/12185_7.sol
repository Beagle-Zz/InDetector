contract c12185{
	// get total hearts by id
	function getTotalHeartsByDappId(uint256 dapp_id) public view returns(uint256) {
		return totals[dapp_id];
	}
}