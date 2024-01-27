contract c8614{
  /**
   * ---------------------------
   * UPDATE JOB STATUS FUNCTIONS
   * ---------------------------
   */
  /**
   * @dev Flags job started, and Stops the hirer from cancelling the job.
   * Can only be called the contractor when job starts.
   * Used to mark the job as started. After this point, hirer must request cancellation
   * Following parameters are used to regenerate the jobHash:
   * @param _jobId The unique ID of the job, from the CoinSparrow database
   * @param _hirer The wallet address of the hiring (buying) party
   * @param _contractor The wallet address of the contractor (selling) party
   * @param _value The ether amount being held in escrow. I.e. job cost - amount hirer is paying contractor
   * @param _fee CoinSparrow fee for this job. Pre-calculated
   */
  function jobStarted(
    bytes16 _jobId,
    address _hirer,
    address _contractor,
    uint256 _value,
    uint256 _fee
  ) external onlyContractor(_contractor)
  {
    //get job Hash
    bytes32 jobHash = getJobHash(
      _jobId,
      _hirer,
      _contractor,
      _value,
      _fee);
    //check the job exists in the contract
    require(jobEscrows[jobHash].exists);
    //check job status.
    require(jobEscrows[jobHash].status == STATUS_JOB_CREATED);
    jobEscrows[jobHash].status = STATUS_JOB_STARTED; //set status
    jobEscrows[jobHash].hirerCanCancelAfter = 0;
    jobEscrows[jobHash].agreedCompletionDate = uint32(block.timestamp) + jobEscrows[jobHash].secondsToComplete;
    emit ContractorStartedJob(jobHash, msg.sender);
  }
}