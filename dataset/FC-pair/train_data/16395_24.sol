contract c16395{
    // Register a vesting schedule to transfer SENC from a group SENC wallet to an individual
    // wallet. For instance, from pre-sale wallet to individual presale contributor address.
    function registerVestingSchedule(address _newAddress, uint _numDays,
        uint _numPeriods, uint _tokens, uint startFrom) 
        public 
        canOperate 
    {
        uint _lockPeriod;
        // Let's not allow the common mistake....
        require(_newAddress != address(0));
        // Check that beneficiary is not already registered
        require(vestingSchedules[_newAddress].tokens == 0);
        // Some lock period sanity checks.
        require(_numDays > 0); 
        require(_numPeriods > 0);
        _lockPeriod = _numDays * 1 days;
        vestingSchedules[_newAddress] = VestingSchedule({
            lockPeriod : _lockPeriod,
            numPeriods : _numPeriods,
            tokens : _tokens,
            amountWithdrawn : 0,
            startTime : startFrom
        });
        if (started) {
            require(vestingToken.transferFrom(vestingWallet, address(this), _tokens));
        } else {
            vestingOwing = vestingOwing.add(_tokens);
        }
        emit VestingScheduleRegistered(_newAddress, vestingWallet, _lockPeriod, _tokens);
    }
}