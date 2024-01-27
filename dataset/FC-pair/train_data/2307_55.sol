contract c2307{
    /** @dev Getter for lastSessionVote in Dispute.
     *  @param _disputeID ID of the dispute.
     *  @param _juror The juror we want to get the last session he voted.
     *  @return lastSessionVote The last session the juror voted.
     */
    function getLastSessionVote(uint _disputeID, address _juror) public view returns (uint lastSessionVote) {
        return disputes[_disputeID].lastSessionVote[_juror];
    }
}