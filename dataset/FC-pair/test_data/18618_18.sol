contract c18618{
    /**
     * @dev transfer an amount of tokens to an account, and then freeze the tokens
     *
     * @param _target the account address that will hold an amount of the tokens
     * @param _value the amount of the tokens which has been transferred
     * @param _frozenEndTime the end time of the lock period, unit is second
     * @param _releasePeriod the locking period, unit is second
     */
    function transferAndFreeze(address _target, uint256 _value, uint256 _frozenEndTime, uint256 _releasePeriod) onlyOwner public returns (bool) {
        //require(_tokenOwner != address(0));
        require(_target != address(0));
        require(_value > 0);
        require(_frozenEndTime > 0);
        // check firstly that the allowance of this contract has been set
        require(owned.allowance(msg.sender, this) > 0);
        // now we need transfer the funds before freeze them
        require(owned.transferFrom(msg.sender, _target, _value));
        // freeze the account after transfering funds
        if (!freeze(_target, _value, _frozenEndTime, _releasePeriod)) {
            return false;
        }
        return true;
    }
}