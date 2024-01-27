contract c2307{
    /** @dev Execute token repartition on a dispute for a specific number of votes.
     *  This should only be called if oneShotTokenRepartition will throw because there are too many votes (will use too much gas).
     *  Note that There are 3 iterations per vote. e.g. A dispute with 1 appeal (2 sessions) and 3 votes per session will have 18 iterations
     *  @param _disputeID ID of the dispute.
     *  @param _maxIterations the maxium number of votes to repartition in this iteration
     */
    function multipleShotTokenRepartition(uint _disputeID, uint _maxIterations) public onlyDuring(Period.Execution) {
        Dispute storage dispute = disputes[_disputeID];
        require(dispute.state <= DisputeState.Resolving);
        require(dispute.session+dispute.appeals <= session);
        dispute.state = DisputeState.Resolving; // Mark as resolving so oneShotTokenRepartition cannot be called on dispute.
        uint winningChoice = dispute.voteCounter[dispute.appeals].winningChoice;
        uint amountShift = getStakePerDraw();
        uint currentIterations = 0; // Total votes we have repartitioned this iteration.
        for (uint i = dispute.currentAppealToRepartition; i <= dispute.appeals; ++i) {
            // Allocate space for new AppealsRepartitioned.
            if (dispute.appealsRepartitioned.length < i+1) {
                dispute.appealsRepartitioned.length++;
            }
            // If the result is a tie, no parties are incoherent and no need to move tokens. Note that 0 (refuse to arbitrate) winning is not a tie.
            if (winningChoice==0 && (dispute.voteCounter[dispute.appeals].voteCount[0] != dispute.voteCounter[dispute.appeals].winningCount)) {
                // If ruling is a tie we can skip to at stake.
                dispute.appealsRepartitioned[i].stage = RepartitionStage.AtStake;
            }
            // First loop to penalize the incoherent votes.
            if (dispute.appealsRepartitioned[i].stage == RepartitionStage.Incoherent) {
                for (uint j = dispute.appealsRepartitioned[i].currentIncoherentVote; j < dispute.votes[i].length; ++j) {
                    if (currentIterations >= _maxIterations) {
                        return;
                    }
                    Vote storage vote = dispute.votes[i][j];
                    if (vote.ruling != winningChoice) {
                        Juror storage juror = jurors[vote.account];
                        uint penalty = amountShift<juror.balance ? amountShift : juror.balance;
                        juror.balance -= penalty;
                        TokenShift(vote.account, _disputeID, int(-penalty));
                        dispute.appealsRepartitioned[i].totalToRedistribute += penalty;
                    } else {
                        ++dispute.appealsRepartitioned[i].nbCoherent;
                    }
                    ++dispute.appealsRepartitioned[i].currentIncoherentVote;
                    ++currentIterations;
                }
                dispute.appealsRepartitioned[i].stage = RepartitionStage.Coherent;
            }
            // Second loop to reward coherent voters
            if (dispute.appealsRepartitioned[i].stage == RepartitionStage.Coherent) {
                if (dispute.appealsRepartitioned[i].nbCoherent == 0) { // No one was coherent at this stage. Give the tokens to the governor.
                    jurors[governor].balance += dispute.appealsRepartitioned[i].totalToRedistribute;
                    TokenShift(governor, _disputeID, int(dispute.appealsRepartitioned[i].totalToRedistribute));
                    dispute.appealsRepartitioned[i].stage = RepartitionStage.AtStake;
                } else { // Otherwise, redistribute them.
                    uint toRedistribute = dispute.appealsRepartitioned[i].totalToRedistribute / dispute.appealsRepartitioned[i].nbCoherent; // Note that few fractions of tokens can be lost but due to the high amount of decimals we don't care.
                    // Second loop to redistribute.
                    for (j = dispute.appealsRepartitioned[i].currentCoherentVote; j < dispute.votes[i].length; ++j) {
                        if (currentIterations >= _maxIterations) {
                            return;
                        }
                        vote = dispute.votes[i][j];
                        if (vote.ruling == winningChoice) {
                            juror = jurors[vote.account];
                            juror.balance += toRedistribute;
                            TokenShift(vote.account, _disputeID, int(toRedistribute));
                        }
                        ++currentIterations;
                        ++dispute.appealsRepartitioned[i].currentCoherentVote;
                    }
                    dispute.appealsRepartitioned[i].stage = RepartitionStage.AtStake;
                }
            }
            if (dispute.appealsRepartitioned[i].stage == RepartitionStage.AtStake) {
                // Third loop to lower the atStake in order to unlock tokens.
                for (j = dispute.appealsRepartitioned[i].currentAtStakeVote; j < dispute.votes[i].length; ++j) {
                    if (currentIterations >= _maxIterations) {
                        return;
                    }
                    vote = dispute.votes[i][j];
                    juror = jurors[vote.account];
                    juror.atStake -= amountShift; // Note that it can't underflow due to amountShift not changing between vote and redistribution.
                    ++currentIterations;
                    ++dispute.appealsRepartitioned[i].currentAtStakeVote;
                }
                dispute.appealsRepartitioned[i].stage = RepartitionStage.Complete;
            }
            if (dispute.appealsRepartitioned[i].stage == RepartitionStage.Complete) {
                ++dispute.currentAppealToRepartition;
            }
        }
        dispute.state = DisputeState.Executable;
    }
}