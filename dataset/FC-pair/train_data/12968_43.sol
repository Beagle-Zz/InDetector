contract c12968{
    /**
     * @dev Unbond delegator's current stake. Delegator enters unbonding state
     */
    function unbond()
        external
        whenSystemNotPaused
        currentRoundInitialized
        autoClaimEarnings
    {
        // Sender must be in bonded state
        require(delegatorStatus(msg.sender) == DelegatorStatus.Bonded);
        Delegator storage del = delegators[msg.sender];
        uint256 currentRound = roundsManager().currentRound();
        // Transition to unbonding phase
        del.withdrawRound = currentRound.add(unbondingPeriod);
        // Decrease delegate's delegated amount
        delegators[del.delegateAddress].delegatedAmount = delegators[del.delegateAddress].delegatedAmount.sub(del.bondedAmount);
        // Update total bonded tokens
        totalBonded = totalBonded.sub(del.bondedAmount);
        if (transcoderStatus(msg.sender) == TranscoderStatus.Registered) {
            // If caller is a registered transcoder, resign
            // In the future, with partial unbonding there would be a check for 0 bonded stake as well
            resignTranscoder(msg.sender);
        }
        if (del.delegateAddress != msg.sender && transcoderStatus(del.delegateAddress) == TranscoderStatus.Registered) {
            // If delegate is not self and is a registered transcoder, decrease its delegated stake
            // We do not need to decrease delegated stake if delegate is self because we would have already removed self
            // from the transcoder pool
            transcoderPool.updateKey(del.delegateAddress, transcoderPool.getKey(del.delegateAddress).sub(del.bondedAmount), address(0), address(0));
        }
        // Delegator no longer bonded to anyone
        del.delegateAddress = address(0);
        // Unbonding delegator does not have a start round
        del.startRound = 0;
        Unbond(del.delegateAddress, msg.sender);
    }
}