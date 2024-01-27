contract c11175{
	/* @dev Return list of bounty addresses */
	function getBountyAddress() view public onlyStaffs returns(address[]){
		return bountyaddress;
	}
}