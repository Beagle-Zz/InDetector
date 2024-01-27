contract c2301{
    /** @dev Execute all the token repartition.
     *  Note that this function could consume to much gas if there is too much votes. 
     *  It is O(v), where v is the number of votes for this dispute.
     *  In the next version, there will also be a function to execute it in multiple calls 
     *  (but note that one shot execution, if possible, is less expensive).
     *  @param _disputeID ID of the dispute.
     */
    function oneShotTokenRepartition(uint _disputeID) public onlyDuring(Period.Execution) {
        Dispute storage dispute = disputes[_disputeID];
        require(dispute.state == DisputeState.Open);
        require(dispute.session+dispute.appeals <= session);
        uint winningChoice = dispute.voteCounter[dispute.appeals].winningChoice;
        uint amountShift = getStakePerDraw();
        for (uint i = 0; i <= dispute.appeals; ++i) {
            // If the result is not a tie, some parties are incoherent. Note that 0 (refuse to arbitrate) winning is not a tie.
            // Result is a tie if the winningChoice is 0 (refuse to arbitrate) and the choice 0 is not the most voted choice.
            // Note that in case of a "tie" among some choices including 0, parties who did not vote 0 are considered incoherent.
            if (winningChoice!=0 || (dispute.voteCounter[dispute.appeals].voteCount[0] == dispute.voteCounter[dispute.appeals].winningCount)) {
                uint totalToRedistribute = 0;
                uint nbCoherent = 0;
                // First loop to penalize the incoherent votes.
                for (uint j = 0; j < dispute.votes[i].length; ++j) {
                    Vote storage vote = dispute.votes[i][j];
                    if (vote.ruling != winningChoice) {
                        Juror storage juror = jurors[vote.account];
                        uint penalty = amountShift<juror.balance ? amountShift : juror.balance;
                        juror.balance -= penalty;
                        TokenShift(vote.account, _disputeID, int(-penalty));
                        totalToRedistribute += penalty;
                    } else {
                        ++nbCoherent;
                    }
                }
                if (nbCoherent == 0) { // No one was coherent at this stage. Give the tokens to the governor.
                    jurors[governor].balance += totalToRedistribute;
                    TokenShift(governor, _disputeID, int(totalToRedistribute));
                } else { // otherwise, redistribute them.
                    uint toRedistribute = totalToRedistribute / nbCoherent; // Note that few fractions of tokens can be lost but due to the high amount of decimals we don't care.
                    // Second loop to redistribute.
                    for (j = 0; j < dispute.votes[i].length; ++j) {
                        vote = dispute.votes[i][j];
                        if (vote.ruling == winningChoice) {
                            juror = jurors[vote.account];
                            juror.balance += toRedistribute;
                            TokenShift(vote.account, _disputeID, int(toRedistribute));
                        }
                    }
                }
            }
            // Third loop to lower the atStake in order to unlock tokens.
            for (j = 0; j < dispute.votes[i].length; ++j) {
                vote = dispute.votes[i][j];
                juror = jurors[vote.account];
                juror.atStake -= amountShift; // Note that it can't underflow due to amountShift not changing between vote and redistribution.
            }
        }
        dispute.state = DisputeState.Executable; // Since it was solved in one shot, go directly to the executable step.
    }
}