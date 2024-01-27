contract c3734{
    /**
    @notice Batch exection of regularTransfer() function
    */
    function batchRegularTransfers(bytes32[] swapIds, bytes32[] secrets)
        public
    {
        require(swapIds.length <= MAX_BATCH_ITERATIONS);
        for (uint i = 0; i < swapIds.length; ++i)
            regularTransfer(swapIds[i], secrets[i]); // Gas estimate `infinite`
    }
}