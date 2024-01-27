contract c2307{
    /** @dev Is the juror drawn in the draw of the dispute.
     *  @param _disputeID ID of the dispute.
     *  @param _juror The juror.
     *  @param _draw The draw. Note that it starts at 1.
     *  @return drawn True if the juror is drawn, false otherwise.
     */
    function isDrawn(uint _disputeID, address _juror, uint _draw) public view returns (bool drawn) {
        Dispute storage dispute = disputes[_disputeID];
        Juror storage juror = jurors[_juror];
        if (juror.lastSession != session
        || (dispute.session+dispute.appeals != session)
        || period<=Period.Draw
        || _draw>amountJurors(_disputeID)
        || _draw==0
        || segmentSize==0
        ) {
            return false;
        } else {
            uint position = uint(keccak256(randomNumber,_disputeID,_draw)) % segmentSize;
            return (position >= juror.segmentStart) && (position < juror.segmentEnd);
        }
    }
}