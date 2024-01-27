contract c7582{
    /**
     * @notice A vote on the target account has concluded, but the motion
     * has not yet been approved, vetoed, or closed. */
    function motionConfirming(uint motionID)
        public
        view
        returns (bool)
    {
        /* These values are timestamps, they will not overflow
         * as they can only ever be initialised to relatively small values.
         */
        uint startTime = motionStartTime[motionID];
        return startTime + votingPeriod <= now &&
               now < startTime + votingPeriod + confirmationPeriod;
    }
}