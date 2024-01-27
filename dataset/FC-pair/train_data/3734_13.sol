contract c3734{
    /**
    @notice Batch exection of reclaimExpiredSwaps() function
    */
    function batchReclaimExpiredSwaps(bytes32 msigId, bytes32[] swapIds)
        public
    {
        require(swapIds.length <= MAX_BATCH_ITERATIONS); // << block.gaslimit / 88281
        for (uint i = 0; i < swapIds.length; ++i)
            reclaimExpiredSwap(msigId, swapIds[i]); // Gas estimate 88281
    }
}