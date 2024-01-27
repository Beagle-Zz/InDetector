contract c4678{
    /**
    @notice Batch execution of convertIntoHtlc() function
    */
    function batchConvertIntoHtlc(
        bytes32[] msigIds,
        address[] beneficiaries,
        uint[] amounts,
        uint[] fees,
        uint[] expirationTimes,
        bytes32[] hashedSecrets
    )
        public
        returns (bytes32[] swapId)
    {
        require(msigIds.length <= MAX_BATCH_ITERATIONS);
        for (uint i = 0; i < msigIds.length; ++i)
            convertIntoHtlc(
                msigIds[i],
                beneficiaries[i],
                amounts[i],
                fees[i],
                expirationTimes[i],
                hashedSecrets[i]
            ); // Gas estimate `infinite`
    }
}