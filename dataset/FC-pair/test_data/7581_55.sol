contract c7581{
    /**
     * @notice Allow a user to withdraw any havvens in their schedule that have vested.
     */
    function vest()
        external
    {
        uint numEntries = numVestingEntries(msg.sender);
        uint total;
        for (uint i = 0; i < numEntries; i++) {
            uint time = getVestingTime(msg.sender, i);
            /* The list is sorted; when we reach the first future time, bail out. */
            if (time > now) {
                break;
            }
            uint qty = getVestingQuantity(msg.sender, i);
            if (qty == 0) {
                continue;
            }
            vestingSchedules[msg.sender][i] = [0, 0];
            total = safeAdd(total, qty);
        }
        if (total != 0) {
            totalVestedBalance = safeSub(totalVestedBalance, total);
            totalVestedAccountBalance[msg.sender] = safeSub(totalVestedAccountBalance[msg.sender], total);
            havven.transfer(msg.sender, total);
            emit Vested(msg.sender, now, total);
        }
    }
}