contract c7581{
    /**
     * @notice Add a new vesting entry at a given time and quantity to an account's schedule.
     * @dev A call to this should be accompanied by either enough balance already available
     * in this contract, or a corresponding call to havven.endow(), to ensure that when
     * the funds are withdrawn, there is enough balance, as well as correctly calculating
     * the fees.
     * This may only be called by the owner during the contract's setup period.
     * Note; although this function could technically be used to produce unbounded
     * arrays, it's only in the foundation's command to add to these lists.
     * @param account The account to append a new vesting entry to.
     * @param time The absolute unix timestamp after which the vested quantity may be withdrawn.
     * @param quantity The quantity of havvens that will vest.
     */
    function appendVestingEntry(address account, uint time, uint quantity)
        public
        onlyOwner
        onlyDuringSetup
    {
        /* No empty or already-passed vesting entries allowed. */
        require(now < time);
        require(quantity != 0);
        /* There must be enough balance in the contract to provide for the vesting entry. */
        totalVestedBalance = safeAdd(totalVestedBalance, quantity);
        require(totalVestedBalance <= havven.balanceOf(this));
        /* Disallow arbitrarily long vesting schedules in light of the gas limit. */
        uint scheduleLength = vestingSchedules[account].length;
        require(scheduleLength <= MAX_VESTING_ENTRIES);
        if (scheduleLength == 0) {
            totalVestedAccountBalance[account] = quantity;
        } else {
            /* Disallow adding new vested havvens earlier than the last one.
             * Since entries are only appended, this means that no vesting date can be repeated. */
            require(getVestingTime(account, numVestingEntries(account) - 1) < time);
            totalVestedAccountBalance[account] = safeAdd(totalVestedAccountBalance[account], quantity);
        }
        vestingSchedules[account].push([time, quantity]);
    }
}