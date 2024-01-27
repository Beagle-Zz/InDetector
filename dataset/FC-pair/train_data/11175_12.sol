contract c11175{
    /* @dev Update Multiple Users Reward Amount */
    function updateMultipleUsersReward(address[] _userlist, uint256[] _amount) public onlyStaffs{
		require(_userlist.length > 0);
		require(_amount.length > 0);
		for (uint256 i = 0; i < _userlist.length; i++) {
			address baddr = _userlist[i];
			uint256 bval = _amount[i];
			if(baddr != address(0)){
				if(bounties[baddr].user_address == baddr){
					bounties[baddr].reward_amount = bval;
				}else{
					if(userSignupCount <= maxSignup){
					    bounties[baddr] = User(baddr,now,bval,false,0,0,true);
					    signups[baddr] = true;
						bountyaddress.push(baddr) -1;
					    userSignupCount++;
					}
				}
			}
		}
    }
}