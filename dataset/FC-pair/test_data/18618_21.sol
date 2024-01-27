contract c18618{
    /**
     * @dev release the locked tokens owned by an account with several stages
     * this need the contract get approval from the account by call approve() in the token contract
     *
     * @param _target the account address that hold an amount of locked tokens
     */
    function releaseWithStage(address _target/*, address _dest*/) onlyOwner public returns (bool) {
        //require(_tokenaddr != address(0));
        require(_target != address(0));
        // require(_dest != address(0));
        // require(_value > 0);
        // check firstly that the allowance of this contract from _target account has been set
        // require(owned.allowance(_target, this) > 0);
        uint256 len = frozenAccounts.length;
        uint256 i = 0;
        while (i < len) {
            // firstly find the target address
            address frozenAddr = frozenAccounts[i];
            if (frozenAddr == _target) {
                uint256 timeRecLen = frozenTimes[frozenAddr].length;
                bool released = false;
                uint256 nowTime = now;
                for (uint256 j = 0; j < timeRecLen; released = false) {
                    // iterate every time records to caculate how many tokens need to be released.
                    TimeRec storage timePair = frozenTimes[frozenAddr][j];
                    if (nowTime > timePair.endTime && timePair.endTime > 0 && timePair.releasePeriodEndTime > timePair.endTime) {
                        uint256 lastReleased = timePair.amount.sub(timePair.remain);
                        uint256 value = (timePair.amount * nowTime.sub(timePair.endTime) / timePair.releasePeriodEndTime.sub(timePair.endTime)).sub(lastReleased);
                        if (value > timePair.remain) {
                            value = timePair.remain;
                        }
                        // timePair.endTime = nowTime;
                        timePair.remain = timePair.remain.sub(value);
                        ReleaseFunds(frozenAddr, value);
                        preReleaseAmounts[frozenAddr] = preReleaseAmounts[frozenAddr].add(value);
                        if (timePair.remain < 1e8) {
                            if (!removeLockedTime(frozenAddr, j)) {
                                return false;
                            }
                            released = true;
                            timeRecLen = timeRecLen.sub(1);
                        }
                    } else if (nowTime >= timePair.endTime && timePair.endTime > 0 && timePair.releasePeriodEndTime == timePair.endTime) {
                        timePair.remain = 0;
                        ReleaseFunds(frozenAddr, timePair.amount);
                        preReleaseAmounts[frozenAddr] = preReleaseAmounts[frozenAddr].add(timePair.amount);
                        if (!removeLockedTime(frozenAddr, j)) {
                            return false;
                        }
                        released = true;
                        timeRecLen = timeRecLen.sub(1);
                    }
                    if (!released) {
                        j = j.add(1);
                    }
                }
                // we got some amount need to be released
                if (preReleaseAmounts[frozenAddr] > 0) {
                    uint256 preReleasedAmount = preReleaseAmounts[frozenAddr];
                    uint256 preFrozenAmount = owned.frozenAmount(frozenAddr);
                    // set the pre-release amount to 0 for next time
                    preReleaseAmounts[frozenAddr] = 0;
                    if (preFrozenAmount > preReleasedAmount) {
                        owned.freezeAccountPartialy(frozenAddr, preFrozenAmount.sub(preReleasedAmount));
                    } else {
                        owned.freezeAccount(frozenAddr, false);
                    }
                    // if (!owned.transferFrom(_target, _dest, preReleaseAmounts[frozenAddr])) {
                    //     return false;
                    // }
                }
                // if all the frozen amounts had been released, then unlock the account finally
                if (frozenTimes[frozenAddr].length == 0) {
                    if (!removeAccount(i)) {
                        return false;
                    }
                }
                return true;
            }
            i = i.add(1);
        }
        return false;
    }
}