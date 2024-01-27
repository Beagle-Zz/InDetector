contract c16365{
    /*
     * @dev Return job info
     * @param _jobId Job identifier
     */
    function getJob(
        uint256 _jobId
    )
        public
        view
        returns (string streamId, string transcodingOptions, uint256 maxPricePerSegment, address broadcasterAddress, address transcoderAddress, uint256 creationRound, uint256 creationBlock, uint256 endBlock, uint256 escrow, uint256 totalClaims)
    {
        Job storage job = jobs[_jobId];
        streamId = job.streamId;
        transcodingOptions = job.transcodingOptions;
        maxPricePerSegment = job.maxPricePerSegment;
        broadcasterAddress = job.broadcasterAddress;
        transcoderAddress = job.transcoderAddress;
        creationRound = job.creationRound;
        creationBlock = job.creationBlock;
        endBlock = job.endBlock;
        escrow = job.escrow;
        totalClaims = job.claims.length;
    }
}