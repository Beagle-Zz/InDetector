contract c2307{
    /** @dev Getter for ruling in Vote.
     *  @param _disputeID ID of the dispute.
     *  @param _appeals Which appeal (or 0 for the initial session).
     *  @param _voteID The ID of the vote for this appeal (or initial session).
     *  @return ruling The ruling given by the voter.
     */
    function getVoteRuling(uint _disputeID, uint _appeals, uint _voteID) public view returns (uint ruling) {
        return disputes[_disputeID].votes[_appeals][_voteID].ruling;
    }
}