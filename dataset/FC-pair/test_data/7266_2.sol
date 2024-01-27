contract c7266{
    // get investors' locked amount of token
    // this lockup will be released in 3 batches: 
    // 1. on delievery date
    // 2. three months after the delivery date
    // 3. six months after the delivery date
    function getLockedAmount_investors(address _investor)
        public
		constant
		returns (uint256)
	{
        uint256 delieveryDate = investors_deliveryDate[_investor];
        uint256 lockedAmt = investors_locked[_investor];
        if (now <= delieveryDate) {return lockedAmt;}
        if (now <= delieveryDate + 1 hours) {return lockedAmt.mul(2).div(3);}
        if (now <= delieveryDate + 2 hours) {return lockedAmt.mul(1).div(3);}
        return 0;
    }
}