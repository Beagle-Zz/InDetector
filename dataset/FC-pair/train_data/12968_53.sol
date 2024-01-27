contract c12968{
    /**
     * @dev Returns pending fees for a delegator from its lastClaimRound through an end round
     * @param _delegator Address of delegator
     * @param _endRound The last round to compute pending fees from
     */
    function pendingFees(address _delegator, uint256 _endRound) public view returns (uint256) {
        uint256 currentRound = roundsManager().currentRound();
        Delegator storage del = delegators[_delegator];
        // End round must be before or equal to current round and after lastClaimRound
        require(_endRound <= currentRound && _endRound > del.lastClaimRound);
        uint256 currentFees = del.fees;
        uint256 currentBondedAmount = del.bondedAmount;
        for (uint256 i = del.lastClaimRound + 1; i <= _endRound; i++) {
            EarningsPool.Data storage earningsPool = transcoders[del.delegateAddress].earningsPoolPerRound[i];
            if (earningsPool.hasClaimableShares()) {
                bool isTranscoder = _delegator == del.delegateAddress;
                // Calculate and add fee pool share from this round
                currentFees = currentFees.add(earningsPool.feePoolShare(currentBondedAmount, isTranscoder));
                // Calculate new bonded amount with rewards from this round. Updated bonded amount used
                // to calculate fee pool share in next round
                currentBondedAmount = currentBondedAmount.add(earningsPool.rewardPoolShare(currentBondedAmount, isTranscoder));
            }
        }
        return currentFees;
    }
}