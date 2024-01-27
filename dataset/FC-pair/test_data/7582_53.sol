contract c7582{
    /**
     * @notice The sender casts a vote in favour of confiscation of the
     * target account's nomin balance.
     */
    function voteFor(uint motionID)
        external
    {
        uint weight = setupVote(motionID);
        vote[msg.sender][motionID] = Vote.Yea;
        votesFor[motionID] = safeAdd(votesFor[motionID], weight);
        emit VotedFor(msg.sender, motionID, weight);
    }
}