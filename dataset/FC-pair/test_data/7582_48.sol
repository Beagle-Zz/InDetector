contract c7582{
    /**
     * @notice A vote motion either not begun, or it has completely terminated.
     */
    function motionWaiting(uint motionID)
        public
        view
        returns (bool)
    {
        /* These values are timestamps, they will not overflow
         * as they can only ever be initialised to relatively small values. */
        return motionStartTime[motionID] + votingPeriod + confirmationPeriod <= now;
    }
}