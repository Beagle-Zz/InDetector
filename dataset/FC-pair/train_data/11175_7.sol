contract c11175{
    /* @dev Remove staff from whitelist */
	function removeStaffWhitelist(address[] _userlist) public onlyAdmin{
		require(_userlist.length > 0);
		for (uint256 i = 0; i < _userlist.length; i++) {
			address baddr = _userlist[i];
			if(baddr != address(0)){
				if(staffs[baddr]){
					staffs[baddr] = false;
				}
			}
		}
	}
}