contract c2307{
    /** @dev Getter for winningCount in VoteCounter.
     *  @param _disputeID ID of the dispute.
     *  @param _appeals Which appeal (or 0 for the initial session).
     *  @return winningCount The amount of votes the winning choice (or those who are tied) has.
     */
    function getWinningCount(uint _disputeID, uint _appeals) public view returns (uint winningCount) {
        return disputes[_disputeID].voteCounter[_appeals].winningCount;
    }
}