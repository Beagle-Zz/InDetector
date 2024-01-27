contract c11175{
	/* @dev Check is the address is in Staff list */
	function chkStaff(address _address) view public onlyAdmin returns(bool){
		return staffs[_address];
	}
}