contract c16630{
    /**
    * @dev Function is used to distribute tokens and confirm the lock time.
    * @param _to address The address which you want to transfer to
    * @param _value uint256 The amount of tokens to be transferred
    * @param _lockupRate uint256 The proportion of tokens that are expected to be locked.
    * @notice If you lock 50%, the lockout time is six months.
    *         If you lock 100%, the lockout time is one year.
    */
    function distribute(address _to, uint256 _value, uint256 _lockupRate) public onlyOwner returns (bool) {
        require(_to != address(0));
        require(_to != address(this));
        //Do not allow multiple distributions of the same address. Avoid locking time reset.
        require(_lockupBalances[_to] == 0);     
        require(_value <= _balances[owner]);
        require(_lockupRate == 50 || _lockupRate == 100);
        _balances[owner] = _balances[owner].sub(_value);
        uint256 lockupValue = _value.mul(_lockupRate).div(100);
        uint256 givenValue = _value.sub(lockupValue);
        uint256 ExpireTime = now + LOCKUP_TERM; //six months
        if (_lockupRate == 100) {
            ExpireTime += LOCKUP_TERM;          //one year.
        }
        _balances[_to] = _balances[_to].add(givenValue);
        _lockupBalances[_to] = _lockupBalances[_to].add(lockupValue);
        _lockupExpireTime[_to] = ExpireTime;
        emit Transfer(owner, _to, _value);
        return true;
    }
}