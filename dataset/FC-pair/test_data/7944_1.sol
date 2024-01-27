contract c7944{
    // get contributors' locked amount of token
    // this lockup will be released in 8 batches which take place every 180 days
    function getLockedAmount_contributors(address _contributor) 
        public
		constant
		returns (uint256)
	{
        uint256 countdownDate = contributors_countdownDate[_contributor];
        uint256 lockedAmt = contributors_locked[_contributor];
        if (now <= countdownDate +  1 hours) {return lockedAmt;}
        if (now <= countdownDate +  2 hours) {return lockedAmt.mul(7).div(8);}
        if (now <= countdownDate +  3 hours) {return lockedAmt.mul(6).div(8);}
        if (now <= countdownDate +  4 hours) {return lockedAmt.mul(5).div(8);}
        if (now <= countdownDate +  5 hours) {return lockedAmt.mul(4).div(8);}
        if (now <= countdownDate +  6 hours) {return lockedAmt.mul(3).div(8);}
        if (now <= countdownDate +  7 hours) {return lockedAmt.mul(2).div(8);}
        if (now <= countdownDate +  8 hours) {return lockedAmt.mul(1).div(8);}
        return 0;
    }
}