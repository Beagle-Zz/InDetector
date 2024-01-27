contract c246{
    /** @dev Vote a ruling. Juror must input the draw ID he was drawn.
     *  Note that the complexity is O(d), where d is amount of times the juror was drawn.
     *  Since being drawn multiple time is a rare occurrence and that a juror can always vote with less weight than it has, it is not a problem.
     *  But note that it can lead to arbitration fees being kept by the contract and never distributed.
     *  @param _disputeID The ID of the dispute the juror was drawn.
     *  @param _ruling The ruling given.
     *  @param _draws The list of draws the juror was drawn. Draw numbering starts at 1 and the numbers should be increasing.
     */
    function voteRuling(uint _disputeID, uint _ruling, uint[] _draws) public onlyDuring(Period.Vote) {
        Dispute storage dispute = disputes[_disputeID];
        Juror storage juror = jurors[msg.sender];
        VoteCounter storage voteCounter = dispute.voteCounter[dispute.appeals];
        require(dispute.lastSessionVote[msg.sender] != session); // Make sure juror hasn't voted yet.
        require(_ruling <= dispute.choices);
        // Note that it throws if the draws are incorrect.
        require(validDraws(msg.sender, _disputeID, _draws));
        dispute.lastSessionVote[msg.sender] = session;
        voteCounter.voteCount[_ruling] += _draws.length;
        if (voteCounter.winningCount < voteCounter.voteCount[_ruling]) {
            voteCounter.winningCount = voteCounter.voteCount[_ruling];
            voteCounter.winningChoice = _ruling;
        } else if (voteCounter.winningCount==voteCounter.voteCount[_ruling] && _draws.length!=0) { // Verify draw length to be non-zero to avoid the possibility of setting tie by casting 0 votes.
            voteCounter.winningChoice = 0; // It's currently a tie.
        }
        for (uint i = 0; i < _draws.length; ++i) {
            dispute.votes[dispute.appeals].push(Vote({
                account: msg.sender,
                ruling: _ruling
            }));
        }
        juror.atStake += _draws.length * getStakePerDraw();
        uint feeToPay = _draws.length * dispute.arbitrationFeePerJuror;
        msg.sender.transfer(feeToPay);
        ArbitrationReward(msg.sender, _disputeID, feeToPay);
    }
}