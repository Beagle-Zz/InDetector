contract c2307{
    /** @dev Return the current ruling of a dispute. This is useful for parties to know if they should appeal.
     *  @param _disputeID ID of the dispute.
     *  @return ruling The current ruling which will be given if there is no appeal. If it is not available, return 0.
     */
    function currentRuling(uint _disputeID) public view returns (uint ruling) {
        Dispute storage dispute = disputes[_disputeID];
        return dispute.voteCounter[dispute.appeals].winningChoice;
    }
}