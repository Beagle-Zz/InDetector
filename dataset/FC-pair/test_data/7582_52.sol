contract c7582{
    /**
     * @notice Shared vote setup function between voteFor and voteAgainst.
     * @return Returns the voter's vote weight. */
    function setupVote(uint motionID)
        internal
        returns (uint)
    {
        /* There must be an active vote for this target running.
         * Vote totals must only change during the voting phase. */
        require(motionVoting(motionID));
        /* The voter must not have an active vote this motion. */
        require(!hasVoted(msg.sender, motionID));
        /* The voter may not cast votes on themselves. */
        require(msg.sender != motionTarget[motionID]);
        uint weight = havven.recomputeLastAverageBalance(msg.sender);
        /* Users must have a nonzero voting weight to vote. */
        require(weight > 0);
        voteWeight[msg.sender][motionID] = weight;
        return weight;
    }
}