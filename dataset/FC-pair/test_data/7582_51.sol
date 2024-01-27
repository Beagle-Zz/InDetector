contract c7582{
    /* ========== MUTATIVE FUNCTIONS ========== */
    /**
     * @notice Begin a motion to confiscate the funds in a given nomin account.
     * @dev Only the foundation, or accounts with sufficient havven balances
     * may elect to start such a motion.
     * @return Returns the ID of the motion that was begun.
     */
    function beginMotion(address target)
        external
        returns (uint)
    {
        /* A confiscation motion must be mooted by someone with standing. */
        require((havven.issuanceLastAverageBalance(msg.sender) >= minStandingBalance) ||
                msg.sender == owner);
        /* Require that the voting period is longer than a single fee period,
         * So that a single vote can span at most two fee periods. */
        require(votingPeriod <= havven.feePeriodDuration());
        /* There must be no confiscation motion already running for this account. */
        require(targetMotionID[target] == 0);
        /* Disallow votes on accounts that are currently frozen. */
        require(!nomin.frozen(target));
        /* It is necessary to roll over the fee period if it has elapsed, or else
         * the vote might be initialised having begun in the past. */
        havven.rolloverFeePeriodIfElapsed();
        uint motionID = nextMotionID++;
        motionTarget[motionID] = target;
        targetMotionID[target] = motionID;
        /* Start the vote at the start of the next fee period */
        uint startTime = havven.feePeriodStartTime() + havven.feePeriodDuration();
        motionStartTime[motionID] = startTime;
        emit MotionBegun(msg.sender, target, motionID, startTime);
        return motionID;
    }
}