contract c18810{
    /* Allow a user to withdraw any tokens that have vested. */
    function vest() 
        external
    {
        uint numEntries = numVestingEntries(msg.sender);
        uint total;
        for (uint i = 0; i < numEntries; i++) {
            uint time = getVestingTime(msg.sender, i);
            // The list is sorted; when we reach the first future time, bail out.
            if (time > now) {
                break;
            }
            uint qty = getVestingQuantity(msg.sender, i);
            if (qty == 0) {
                continue;
            }
            vestingSchedules[msg.sender][i] = [0, 0];
            total = safeAdd(total, qty);
            totalVestedAccountBalance[msg.sender] = safeSub(totalVestedAccountBalance[msg.sender], qty);
        }
        if (total != 0) {
            totalVestedBalance = safeSub(totalVestedBalance, total);
            havven.transfer(msg.sender, total);
            emit Vested(msg.sender, msg.sender,
                   now, total);
        }
    }
}