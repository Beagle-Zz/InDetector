contract c18618{
    /**
     * @dev release the locked tokens owned by an account, which only have only one locked time
     * and don't have release stage.
     *
     * @param _target the account address that hold an amount of locked tokens
     */
    function releaseAccount(address _target) onlyOwner public returns (bool) {
        //require(_tokenAddr != address(0));
        require(_target != address(0));
        uint256 len = frozenAccounts.length;
        uint256 i = 0;
        while (i < len) {
            address destAddr = frozenAccounts[i];
            if (destAddr == _target) {
                if (frozenTimes[destAddr].length == 1 && frozenTimes[destAddr][0].endTime == frozenTimes[destAddr][0].releasePeriodEndTime && frozenTimes[destAddr][0].endTime > 0 && now >= frozenTimes[destAddr][0].endTime) {
                    uint256 releasedAmount = frozenTimes[destAddr][0].amount;
                    // remove current release period time record
                    if (!removeLockedTime(destAddr, 0)) {
                        return false;
                    }
                    // remove the froze account
                    if (!removeAccount(i)) {
                        return false;
                    }
                    uint256 preFrozenAmount = owned.frozenAmount(destAddr);
                    if (preFrozenAmount > releasedAmount) {
                        owned.freezeAccountPartialy(destAddr, preFrozenAmount.sub(releasedAmount));
                    } else {
                        owned.freezeAccount(destAddr, false);
                    }
                    ReleaseFunds(destAddr, releasedAmount);
                }
                // if the account are not locked for once, we will do nothing here
                return true;
            }
            i = i.add(1);
        }
        return false;
    }
}