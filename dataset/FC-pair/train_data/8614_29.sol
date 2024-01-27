contract c8614{
  /**
   * -------------------------
   * DISPUTE RELATED FUNCTIONS
   * -------------------------
   */
  /**
   * @dev Called by hirer or contractor to raise a dispute during started, completed or canellation request statuses
   * Once called, funds are locked until arbitrator can resolve the dispute. Assigned arbitrator
   * will review all information relating to the job, and decide on a fair course of action.
   * Following parameters are used to regenerate the jobHash:
   * @param _jobId The unique ID of the job, from the CoinSparrow database
   * @param _hirer The wallet address of the hiring (buying) party
   * @param _contractor The wallet address of the contractor (selling) party
   * @param _value The ether amount being held in escrow. I.e. job cost - amount hirer is paying contractor
   * @param _fee CoinSparrow fee for this job. Pre-calculated
   */
  function requestDispute(
    bytes16 _jobId,
    address _hirer,
    address _contractor,
    uint256 _value,
    uint256 _fee
  ) external onlyHirerOrContractor(_hirer, _contractor)
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
    require(
      jobEscrows[jobHash].status == STATUS_JOB_STARTED||
      jobEscrows[jobHash].status == STATUS_JOB_COMPLETED||
      jobEscrows[jobHash].status == STATUS_HIRER_REQUEST_CANCEL||
      jobEscrows[jobHash].status == STATUS_CONTRACTOR_REQUEST_CANCEL);
    jobEscrows[jobHash].status = STATUS_JOB_IN_DISPUTE;
    emit DisputeRequested(jobHash, msg.sender);
  }
}