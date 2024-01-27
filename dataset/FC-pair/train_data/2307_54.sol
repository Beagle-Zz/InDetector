contract c2307{
    /** @dev Getter for voteCount in VoteCounter.
     *  @param _disputeID ID of the dispute.
     *  @param _appeals Which appeal (or 0 for the initial session).
     *  @param _choice The choice.
     *  @return voteCount The amount of votes the winning choice (or those who are tied) has.
     */
    function getVoteCount(uint _disputeID, uint _appeals, uint _choice) public view returns (uint voteCount) {
        return disputes[_disputeID].voteCounter[_appeals].voteCount[_choice];
    }
}