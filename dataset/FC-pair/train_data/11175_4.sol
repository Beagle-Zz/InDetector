contract c11175{
	/*******************/
	/* Admin Function **/
	/*******************/
    /* @dev Add admin to whitelist */
	function addAdminWhitelist(address[] _userlist) public onlyOwner onlyAdmin{
		require(_userlist.length > 0);
		for (uint256 i = 0; i < _userlist.length; i++) {
			address baddr = _userlist[i];
			if(baddr != address(0)){
				if(!admins[baddr]){
					admins[baddr] = true;
					adminaddress.push(baddr) -1;
				}
			}
		}
	}
}