contract c16367{
    /**
     * @dev The sender is declaring themselves as a candidate for active transcoding.
     * @param _rewardCut % of reward paid to transcoder by a delegator
     * @param _feeShare % of fees paid to delegators by a transcoder
     * @param _pricePerSegment Price per segment (denominated in Wei) for a stream
     */
    function transcoder(uint256 _rewardCut, uint256 _feeShare, uint256 _pricePerSegment)
        external
        whenSystemNotPaused
        currentRoundInitialized
    {
        Transcoder storage t = transcoders[msg.sender];
        Delegator storage del = delegators[msg.sender];
        if (roundsManager().currentRoundLocked()) {
            // If it is the lock period of the current round
            // the lowest price previously set by any transcoder
            // becomes the price floor and the caller can lower its
            // own price to a point greater than or equal to the price floor
            // Caller must already be a registered transcoder
            require(transcoderStatus(msg.sender) == TranscoderStatus.Registered);
            // Provided rewardCut value must equal the current pendingRewardCut value
            // This value cannot change during the lock period
            require(_rewardCut == t.pendingRewardCut);
            // Provided feeShare value must equal the current pendingFeeShare value
            // This value cannot change during the lock period
            require(_feeShare == t.pendingFeeShare);
            // Iterate through the transcoder pool to find the price floor
            // Since the caller must be a registered transcoder, the transcoder pool size will always at least be 1
            // Thus, we can safely set the initial price floor to be the pendingPricePerSegment of the first
            // transcoder in the pool
            address currentTranscoder = transcoderPool.getFirst();
            uint256 priceFloor = transcoders[currentTranscoder].pendingPricePerSegment;
            for (uint256 i = 0; i < transcoderPool.getSize(); i++) {
                if (transcoders[currentTranscoder].pendingPricePerSegment < priceFloor) {
                    priceFloor = transcoders[currentTranscoder].pendingPricePerSegment;
                }
                currentTranscoder = transcoderPool.getNext(currentTranscoder);
            }
            // Provided pricePerSegment must be greater than or equal to the price floor and
            // less than or equal to the previously set pricePerSegment by the caller
            require(_pricePerSegment >= priceFloor && _pricePerSegment <= t.pendingPricePerSegment);
            t.pendingPricePerSegment = _pricePerSegment;
            TranscoderUpdate(msg.sender, t.pendingRewardCut, t.pendingFeeShare, _pricePerSegment, true);
        } else {
            // It is not the lock period of the current round
            // Caller is free to change rewardCut, feeShare, pricePerSegment as it pleases
            // If caller is not a registered transcoder, it can also register and join the transcoder pool
            // if it has sufficient delegated stake
            // If caller is not a registered transcoder and does not have sufficient delegated stake
            // to join the transcoder pool, it can change rewardCut, feeShare, pricePerSegment
            // as information signals to delegators in an effort to camapaign and accumulate
            // more delegated stake
            // Reward cut must be a valid percentage
            require(MathUtils.validPerc(_rewardCut));
            // Fee share must be a valid percentage
            require(MathUtils.validPerc(_feeShare));
            // Must have a non-zero amount bonded to self
            require(del.delegateAddress == msg.sender && del.bondedAmount > 0);
            t.pendingRewardCut = _rewardCut;
            t.pendingFeeShare = _feeShare;
            t.pendingPricePerSegment = _pricePerSegment;
            uint256 delegatedAmount = del.delegatedAmount;
            // Check if transcoder is not already registered
            if (transcoderStatus(msg.sender) == TranscoderStatus.NotRegistered) {
                if (!transcoderPool.isFull()) {
                    // If pool is not full add new transcoder
                    transcoderPool.insert(msg.sender, delegatedAmount, address(0), address(0));
                } else {
                    address lastTranscoder = transcoderPool.getLast();
                    if (delegatedAmount > transcoderPool.getKey(lastTranscoder)) {
                        // If pool is full and caller has more delegated stake than the transcoder in the pool with the least delegated stake:
                        // - Evict transcoder in pool with least delegated stake
                        // - Add caller to pool
                        transcoderPool.remove(lastTranscoder);
                        transcoderPool.insert(msg.sender, delegatedAmount, address(0), address(0));
                        TranscoderEvicted(lastTranscoder);
                    }
                }
            }
            TranscoderUpdate(msg.sender, _rewardCut, _feeShare, _pricePerSegment, transcoderPool.contains(msg.sender));
        }
    }
}