contract c3734{
    /**
    @notice Reclaim an expired, non-empty swap into a multisig
    @dev Transfer swap amount to beneficiary of swap and fee to authority
    @param msigId Unique (owner, authority, balance != 0) multisig identifier to which deposit expired swaps
    @param swapId Unique (initiator, beneficiary, amount, fee, expirationTime, hashedSecret) swap identifier
    */
    function reclaimExpiredSwap(bytes32 msigId, bytes32 swapId)
        public
    {
        // Require: msg.sender == ower or authority
        require(
            multisigs[msigId].owner == msg.sender ||
            multisigs[msigId].authority == msg.sender
        );
        // Require msigId matches swapId
        require(msigId == atomicswaps[swapId].msigId);
        // Require: is expired
        require(now >= atomicswaps[swapId].expirationTime);
        uint amount = atomicswaps[swapId].amount;
        delete atomicswaps[swapId];
        multisigs[msigId].deposit = add(multisigs[msigId].deposit, amount);
    }
}