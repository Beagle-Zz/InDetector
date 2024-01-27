contract c11171{
    /* @dev Remove admin from whitelist */
	function removeAdminWhitelist(address[] _userlist) public onlyAdmin{
		require(_userlist.length > 0);
		for (uint256 i = 0; i < _userlist.length; i++) {
			address baddr = _userlist[i];
			if(baddr != address(0)){
				if(admins[baddr]){
					admins[baddr] = false;
				}
			}
		}
	}
}