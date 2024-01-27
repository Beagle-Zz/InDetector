contract c18618{
    /**
     * release the token which are locked for once and will be total released at once
     * after the end point of the lock period
     */
    function releaseAllOnceLock() onlyOwner public returns (bool) {
        //require(_tokenAddr != address(0));
        uint256 len = frozenAccounts.length;
        uint256 i = 0;
        while (i < len) {
            address target = frozenAccounts[i];
            if (frozenTimes[target].length == 1 && frozenTimes[target][0].endTime == frozenTimes[target][0].releasePeriodEndTime && frozenTimes[target][0].endTime > 0 && now >= frozenTimes[target][0].endTime) {
                uint256 releasedAmount = frozenTimes[target][0].amount;
                // remove current release period time record
                if (!removeLockedTime(target, 0)) {
                    return false;
                }
                // remove the froze account
                if (!removeAccount(i)) {
                    return false;
                }
                uint256 preFrozenAmount = owned.frozenAmount(target);
                if (preFrozenAmount > releasedAmount) {
                    owned.freezeAccountPartialy(target, preFrozenAmount.sub(releasedAmount));
                } else {
                    owned.freezeAccount(target, false);
                }
                ReleaseFunds(target, releasedAmount);
                len = len.sub(1);
            } else {
                // no account has been removed
                i = i.add(1);
            }
        }
        return true;
    }
}