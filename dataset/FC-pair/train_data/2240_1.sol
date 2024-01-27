contract c2240{
    // get contributors' locked amount of token
    // this lockup will be released in 8 batches which take place every 180 days
    function getLockedAmount_contributors(address _contributor) 
        public
		constant
		returns (uint256)
	{
        uint256 countdownDate = contributors_countdownDate[_contributor];
        uint256 lockedAmt = contributors_locked[_contributor];
        if (now <= countdownDate + (180 * 1 days)) {return lockedAmt;}
        if (now <= countdownDate + (180 * 2 days)) {return lockedAmt.mul(7).div(8);}
        if (now <= countdownDate + (180 * 3 days)) {return lockedAmt.mul(6).div(8);}
        if (now <= countdownDate + (180 * 4 days)) {return lockedAmt.mul(5).div(8);}
        if (now <= countdownDate + (180 * 5 days)) {return lockedAmt.mul(4).div(8);}
        if (now <= countdownDate + (180 * 6 days)) {return lockedAmt.mul(3).div(8);}
        if (now <= countdownDate + (180 * 7 days)) {return lockedAmt.mul(2).div(8);}
        if (now <= countdownDate + (180 * 8 days)) {return lockedAmt.mul(1).div(8);}
        return 0;
    }
}