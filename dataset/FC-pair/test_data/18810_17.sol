contract c18810{
    /* ========== MUTATIVE FUNCTIONS ========== */
    /* Begin a motion to confiscate the funds in a given nomin account.
     * Only the foundation, or accounts with sufficient havven balances
     * may elect to start such a motion.
     * Returns the ID of the motion that was begun. */
    function beginMotion(address target)
        external
        returns (uint)
    {
        // A confiscation motion must be mooted by someone with standing.
        require((havven.balanceOf(msg.sender) >= minStandingBalance) ||
                msg.sender == owner);
        // Require that the voting period is longer than a single fee period,
        // So that a single vote can span at most two fee periods.
        require(votingPeriod <= havven.targetFeePeriodDurationSeconds());
        // There must be no confiscation motion already running for this account.
        require(targetMotionID[target] == 0);
        // Disallow votes on accounts that have previously been frozen.
        require(!nomin.frozen(target));
        uint motionID = nextMotionID++;
        motionTarget[motionID] = target;
        targetMotionID[target] = motionID;
        motionStartTime[motionID] = now;
        emit MotionBegun(msg.sender, msg.sender, target, target, motionID, motionID);
        return motionID;
    }
}