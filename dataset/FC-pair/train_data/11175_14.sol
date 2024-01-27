contract c11175{
	/* @dev Check is the address is in Admin list */
	function chkAdmin(address _address) view public onlyAdmin returns(bool){
		return admins[_address];
	}
}