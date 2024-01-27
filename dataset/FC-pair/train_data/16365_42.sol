contract c16365{
    /*
     * @dev Distribute fees for multiple claims
     * @param _jobId Job identifier
     * @param _claimId Claim identifier
     */
    function batchDistributeFees(uint256 _jobId, uint256[] _claimIds)
        external
        whenSystemNotPaused
    {
        for (uint256 i = 0; i < _claimIds.length; i++) {
            distributeFees(_jobId, _claimIds[i]);
        }
    }
}