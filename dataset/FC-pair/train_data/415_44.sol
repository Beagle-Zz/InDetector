contract c415{
    /** @dev Steal part of the tokens and the arbitration fee of a juror who failed to vote.
     *  Note that a juror who voted but without all his weight can't be penalized.
     *  It is possible to not penalize with the maximum weight.
     *  But note that it can lead to arbitration fees being kept by the contract and never distributed.
     *  @param _jurorAddress Address of the juror to steal tokens from.
     *  @param _disputeID The ID of the dispute the juror was drawn.
     *  @param _draws The list of draws the juror was drawn. Numbering starts at 1 and the numbers should be increasing.
     */
    function penalizeInactiveJuror(address _jurorAddress, uint _disputeID, uint[] _draws) public {
        Dispute storage dispute = disputes[_disputeID];
        Juror storage inactiveJuror = jurors[_jurorAddress];
        require(period > Period.Vote);
        require(dispute.lastSessionVote[_jurorAddress] != session); // Verify the juror hasn't voted.
        dispute.lastSessionVote[_jurorAddress] = session; // Update last session to avoid penalizing multiple times.
        require(validDraws(_jurorAddress, _disputeID, _draws));
        uint penality = _draws.length * minActivatedToken * 2 * alpha / ALPHA_DIVISOR;
        penality = (penality < inactiveJuror.balance) ? penality : inactiveJuror.balance; // Make sure the penality is not higher than the balance.
        inactiveJuror.balance -= penality;
        TokenShift(_jurorAddress, _disputeID, -int(penality));
        jurors[msg.sender].balance += penality / 2; // Give half of the penalty to the caller.
        TokenShift(msg.sender, _disputeID, int(penality / 2));
        jurors[governor].balance += penality / 2; // The other half to the governor.
        TokenShift(governor, _disputeID, int(penality / 2));
        msg.sender.transfer(_draws.length*dispute.arbitrationFeePerJuror); // Give the arbitration fees to the caller.
    }
}