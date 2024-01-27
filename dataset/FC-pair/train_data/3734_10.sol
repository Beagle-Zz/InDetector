contract c3734{
    /**
    @notice Withdraw ether and delete the htlc swap. Equivalent to REGULAR_TRANSFER in Nimiq
    @dev Transfer swap amount to beneficiary of swap and fee to authority
    @param swapId Unique (initiator, beneficiary, amount, fee, expirationTime, hashedSecret) swap identifier
    @param secret Hashed secret of htlc swap
    */
    function regularTransfer(bytes32 swapId, bytes32 secret)
        public
    {
        // Require valid secret provided
        require(sha256(secret) == atomicswaps[swapId].hashedSecret);
        uint amount = atomicswaps[swapId].amount;
        address beneficiary = atomicswaps[swapId].beneficiary;
        // Delete swap
        delete atomicswaps[swapId];
        // Execute swap
        beneficiary.transfer(amount);
    }
}