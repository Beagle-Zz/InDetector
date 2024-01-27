contract c2301{
    /** @dev Getter for winningChoice in VoteCounter.
     *  @param _disputeID ID of the dispute.
     *  @param _appeals Which appeal (or 0 for the initial session).
     *  @return winningChoice The currently winning choice (or 0 if it's tied). Note that 0 can also be return if the majority refuses to arbitrate.
     */
    function getWinningChoice(uint _disputeID, uint _appeals) public view returns (uint winningChoice) {
        return disputes[_disputeID].voteCounter[_appeals].winningChoice;
    }
}