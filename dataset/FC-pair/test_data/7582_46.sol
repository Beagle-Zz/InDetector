contract c7582{
    /* ========== VIEW FUNCTIONS ========== */
    /**
     * @notice There is a motion in progress on the specified
     * account, and votes are being accepted in that motion.
     */
    function motionVoting(uint motionID)
        public
        view
        returns (bool)
    {
        return motionStartTime[motionID] < now && now < motionStartTime[motionID] + votingPeriod;
    }
}