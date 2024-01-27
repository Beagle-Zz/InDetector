contract c11171{
	/***************************/
	/* Admin & Staff Function **/
	/***************************/
	/* @dev Admin/Staffs Update Contract Configuration */
    /* @dev Add user to whitelist */
    function signupUserWhitelist(address[] _userlist, uint256[] _amount) public onlyAdmin{
    	require(_userlist.length > 0);
		require(_amount.length > 0);
    	for (uint256 i = 0; i < _userlist.length; i++) {
    		address baddr = _userlist[i];
    		uint256 bval = _amount[i];
    		if(baddr != address(0)){
    			if(bounties[baddr].user_address != baddr){
					bounties[baddr] = User(baddr,now,0,false,now,bval,true);
					token.transfer(baddr, bval);
    			}
    		}
    	}
    }
}