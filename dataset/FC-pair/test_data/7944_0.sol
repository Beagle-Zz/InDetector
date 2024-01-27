contract c7944{
    // MODIFIER
    // checks if the address can transfer certain amount of tokens
    modifier canTransfer(address _sender, uint256 _value) {
        require(_sender != address(0));
        uint256 remaining = balances[_sender].sub(_value);
        uint256 totalLockAmt = 0;
        if (contributors_locked[_sender] > 0) {
            totalLockAmt = totalLockAmt.add(getLockedAmount_contributors(_sender));
        }
        if (investors_locked[_sender] > 0) {
            totalLockAmt = totalLockAmt.add(getLockedAmount_investors(_sender));
        }
        require(remaining >= totalLockAmt);
        _;
    }
}