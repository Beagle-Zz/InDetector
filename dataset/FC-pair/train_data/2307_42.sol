contract c2307{
    /** @dev Must be used to verify that a juror has been draw at least _draws.length times.
     *  We have to require the user to specify the draws that lead the juror to be drawn.
     *  Because doing otherwise (looping through all draws) could consume too much gas.
     *  @param _jurorAddress Address of the juror we want to verify draws.
     *  @param _disputeID The ID of the dispute the juror was drawn.
     *  @param _draws The list of draws the juror was drawn. It draw numbering starts at 1 and the numbers should be increasing.
     *  Note that in most cases this list will just contain 1 number.
     *  @param valid true if the draws are valid.
     */
    function validDraws(address _jurorAddress, uint _disputeID, uint[] _draws) public view returns (bool valid) {
        uint draw = 0;
        Juror storage juror = jurors[_jurorAddress];
        Dispute storage dispute = disputes[_disputeID];
        uint nbJurors = amountJurors(_disputeID);
        if (juror.lastSession != session) return false; // Make sure that the tokens were deposited for this session.
        if (dispute.session+dispute.appeals != session) return false; // Make sure there is currently a dispute.
        if (period <= Period.Draw) return false; // Make sure that jurors are already drawn.
        for (uint i = 0; i < _draws.length; ++i) {
            if (_draws[i] <= draw) return false; // Make sure that draws are always increasing to avoid someone inputing the same multiple times.
            draw = _draws[i];
            if (draw > nbJurors) return false;
            uint position = uint(keccak256(randomNumber, _disputeID, draw)) % segmentSize; // Random position on the segment for draw.
            require(position >= juror.segmentStart);
            require(position < juror.segmentEnd);
        }
        return true;
    }
}