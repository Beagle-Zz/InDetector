contract c4678{
    /**
    @notice First or second stage of atomic swap.
    @param msigId Unique (owner, authority, balance != 0) multisig identifier
    @param beneficiary Beneficiary of this swap
    @param amount Convert this amount from multisig into swap
    @param fee Fee amount to be paid to multisig authority
    @param expirationTime Swap expiration timestamp in seconds; not more than 1 day from now
    @param hashedSecret sha256(secret), hashed secret of swap initiator
    @return swapId Unique (initiator, beneficiary, amount, fee, expirationTime, hashedSecret) swap identifier
    */
    function convertIntoHtlc(bytes32 msigId, address beneficiary, uint amount, uint fee, uint expirationTime, bytes32 hashedSecret)
        public
        returns (bytes32 swapId)
    {
        // Require owner with sufficient deposit
        require(multisigs[msigId].owner == msg.sender);
        require(multisigs[msigId].deposit >= amount + fee); // Checks for underflow
        require(
            now <= expirationTime &&
            expirationTime <= min(now + 1 days, multisigs[msigId].unlockTime)
        ); // Not more than 1 day or unlockTime
        require(amount > 0); // Non-empty amount as definition for active swap
        require(!isAntecedentHashedSecret[hashedSecret]);
        isAntecedentHashedSecret[hashedSecret] = true;
        // Account in multisig balance
        multisigs[msigId].deposit = sub(multisigs[msigId].deposit, add(amount, fee));
        // Create swap identifier
        swapId = keccak256(
            msigId,
            msg.sender,
            beneficiary,
            amount,
            fee,
            expirationTime,
            hashedSecret
        );
        emit AtomicSwapInitialised(swapId);
        // Create swap
        AtomicSwap storage swap = atomicswaps[swapId];
        swap.msigId = msigId;
        swap.initiator = msg.sender;
        swap.beneficiary = beneficiary;
        swap.amount = amount;
        swap.fee = fee;
        swap.expirationTime = expirationTime;
        swap.hashedSecret = hashedSecret;
        // Transfer fee to fee recipient
        FEE_RECIPIENT.transfer(fee);
    }
}