contract c10855{
	/**
     * Lock given amount of given EIP-20 tokens until given time arrives, after
     * this time allow the tokens to be transferred to given beneficiary.  This
     * contract should be allowed to transfer at least given amount of tokens
     * from msg.sender.
     *
     * @param _beneficiary beneficiary to receive tokens after unlock time
     * @param _amount amount of tokens to be locked
     * @param _lockTime unlock time
     *
     * @return time lock ID
     */
    function lock (
      address _beneficiary, uint256 _amount,
        uint256 _lockTime) public returns (uint256) {
        require (_amount > 0);
        require (_lockTime > 0);
        nextLockID = nextLockID.add(1);
        uint256 id = nextLockID;
        TokenTimeLockInfo storage lockInfo = locks [id];
        require (lockInfo.beneficiary == 0x0);
        require (lockInfo.amount == 0);
        require (lockInfo.unlockTime == 0);
        lockInfo.beneficiary = _beneficiary;
        lockInfo.amount = _amount;
        lockInfo.unlockTime =  now.add(_lockTime);
        emit Lock (id, _beneficiary, _amount, _lockTime);
        require (ISC.transferFrom (msg.sender, this, _amount));
        return id;
    }
}