contract c8614{
  /**
   * @dev returns the date after which the Hirer can cancel the job
   * Following parameters are used to regenerate the jobHash:
   * @param _jobId The unique ID of the job, from the CoinSparrow database
   * @param _hirer The wallet address of the hiring (buying) party
   * @param _contractor The wallet address of the contractor (selling) party
   * @param _value The ether amount being held in escrow. I.e. job cost - amount hirer is paying contractor
   * @param _fee CoinSparrow fee for this job. Pre-calculated
   * @return hirerCanCancelAfter timestamp for date after which the hirer can cancel
   */
  function getJobCanCancelAfter(
    bytes16 _jobId,
    address _hirer,
    address _contractor,
    uint256 _value,
    uint256 _fee) external view returns (uint32)
  {
    //get job Hash
    bytes32 jobHash = getJobHash(
      _jobId,
      _hirer,
      _contractor,
      _value,
      _fee);
    uint32 hirerCanCancelAfter = 0;
    if (jobEscrows[jobHash].exists) {
      hirerCanCancelAfter = jobEscrows[jobHash].hirerCanCancelAfter;
    }
    return hirerCanCancelAfter;
  }
}