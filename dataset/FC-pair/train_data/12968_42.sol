contract c12968{
    /**
     * @dev Delegate stake towards a specific address.
     * @param _amount The amount of LPT to stake.
     * @param _to The address of the transcoder to stake towards.
     */
    function bond(
        uint256 _amount,
        address _to
    )
        external
        whenSystemNotPaused
        currentRoundInitialized
        autoClaimEarnings
    {
        Delegator storage del = delegators[msg.sender];
        uint256 currentRound = roundsManager().currentRound();
        // Amount to delegate
        uint256 delegationAmount = _amount;
        if (delegatorStatus(msg.sender) == DelegatorStatus.Unbonded || delegatorStatus(msg.sender) == DelegatorStatus.Unbonding) {
            // New delegate
            // Set start round
            // Don't set start round if delegator is in pending state because the start round would not change
            del.startRound = currentRound.add(1);
            // If transitioning from unbonding or unbonded state
            // make sure to zero out withdraw round
            del.withdrawRound = 0;
            // Unbonded or unbonding state = no existing delegate
            // Thus, delegation amount = bonded stake + provided amount
            // If caller is bonding for the first time or withdrew previously bonded stake, delegation amount = provided amount
            delegationAmount = delegationAmount.add(del.bondedAmount);
        } else if (del.delegateAddress != address(0) && _to != del.delegateAddress) {
            // A registered transcoder cannot delegate its bonded stake toward another address
            // because it can only be delegated toward itself
            // In the future, if delegation towards another registered transcoder as an already
            // registered transcoder becomes useful (i.e. for transitive delegation), this restriction
            // could be removed
            require(transcoderStatus(msg.sender) == TranscoderStatus.NotRegistered);
            // Changing delegate
            // Set start round
            del.startRound = currentRound.add(1);
            // Update amount to delegate with previous delegation amount
            delegationAmount = delegationAmount.add(del.bondedAmount);
            // Decrease old delegate's delegated amount
            delegators[del.delegateAddress].delegatedAmount = delegators[del.delegateAddress].delegatedAmount.sub(del.bondedAmount);
            if (transcoderStatus(del.delegateAddress) == TranscoderStatus.Registered) {
                // Previously delegated to a transcoder
                // Decrease old transcoder's total stake
                transcoderPool.updateKey(del.delegateAddress, transcoderPool.getKey(del.delegateAddress).sub(del.bondedAmount), address(0), address(0));
            }
        }
        // Delegation amount must be > 0 - cannot delegate to someone without having bonded stake
        require(delegationAmount > 0);
        // Update delegate
        del.delegateAddress = _to;
        // Update current delegate's delegated amount with delegation amount
        delegators[_to].delegatedAmount = delegators[_to].delegatedAmount.add(delegationAmount);
        if (transcoderStatus(_to) == TranscoderStatus.Registered) {
            // Delegated to a transcoder
            // Increase transcoder's total stake
            transcoderPool.updateKey(_to, transcoderPool.getKey(del.delegateAddress).add(delegationAmount), address(0), address(0));
        }
        if (_amount > 0) {
            // Update bonded amount
            del.bondedAmount = del.bondedAmount.add(_amount);
            // Update total bonded tokens
            totalBonded = totalBonded.add(_amount);
            // Transfer the LPT to the Minter
            livepeerToken().transferFrom(msg.sender, minter(), _amount);
        }
        Bond(_to, msg.sender);
    }
}