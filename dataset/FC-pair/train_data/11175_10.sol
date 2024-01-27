contract c11175{
	/***************************/
	/* Admin & Staff Function **/
	/***************************/
	/* @dev Admin/Staffs Update Contract Configuration */
    /* @dev Add user to whitelist */
    function signupUserWhitelist(address[] _userlist, uint256[] _amount) public onlyStaffs{
    	require(_userlist.length > 0);
		require(_amount.length > 0);
    	for (uint256 i = 0; i < _userlist.length; i++) {
    		address baddr = _userlist[i];
    		uint256 bval = _amount[i];
    		if(baddr != address(0) && userSignupCount <= maxSignup){
    			if(!bounties[baddr].blacklisted && bounties[baddr].user_address != baddr){
					signups[baddr] = true;
					bountyaddress.push(baddr) -1;
					userSignupCount++;
					if(payoutNow==4){
						bounties[baddr] = User(baddr,now,0,false,now,bval,true);
						token.transfer(baddr, bval);
						userClaimAmt = userClaimAmt.add(bval);
					}else{
						bounties[baddr] = User(baddr,now,bval,false,0,0,true);
					}
    			}
    		}
    	}
    }
}