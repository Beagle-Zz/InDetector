contract c12968{
    /**
     * @dev Update a delegator with token pools shares from its lastClaimRound through a given round
     * @param _delegator Delegator address
     * @param _endRound The last round for which to update a delegator's stake with token pools shares
     */
    function updateDelegatorWithEarnings(address _delegator, uint256 _endRound) internal {
        Delegator storage del = delegators[_delegator];
        // Only will have earnings to claim if you have a delegate
        // If not delegated, skip the earnings claim process
        if (del.delegateAddress != address(0)) {
            // Cannot claim earnings for more than maxEarningsClaimsRounds
            // This is a number to cause transactions to fail early if
            // we know they will require too much gas to loop through all the necessary rounds to claim earnings
            // The user should instead manually invoke `claimEarnings` to split up the claiming process
            // across multiple transactions
            require(_endRound.sub(del.lastClaimRound) <= maxEarningsClaimsRounds);
            uint256 currentBondedAmount = del.bondedAmount;
            uint256 currentFees = del.fees;
            for (uint256 i = del.lastClaimRound + 1; i <= _endRound; i++) {
                EarningsPool.Data storage earningsPool = transcoders[del.delegateAddress].earningsPoolPerRound[i];
                if (earningsPool.hasClaimableShares()) {
                    bool isTranscoder = _delegator == del.delegateAddress;
                    var (fees, rewards) = earningsPool.claimShare(currentBondedAmount, isTranscoder);
                    currentFees = currentFees.add(fees);
                    currentBondedAmount = currentBondedAmount.add(rewards);
                }
            }
            // Rewards are bonded by default
            del.bondedAmount = currentBondedAmount;
            del.fees = currentFees;
        }
        del.lastClaimRound = _endRound;
    }
}