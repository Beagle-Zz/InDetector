contract c8614{
  /**
   * @dev Can be called by the hirer to claim a full refund, if job has been started but contractor has not
   * completed within 4 weeks after agreed completion date, and becomes unresponsive.
   * Following parameters are used to regenerate the jobHash:
   * @param _jobId The unique ID of the job, from the CoinSparrow database
   * @param _hirer The wallet address of the hiring (buying) party
   * @param _contractor The wallet address of the contractor (selling) party
   * @param _value The ether amount being held in escrow. I.e. job cost - amount hirer is paying contractor
   * @param _fee CoinSparrow fee for this job. Pre-calculated
   */
  function hirerLastResortRefund(
    bytes16 _jobId,
    address _hirer,
    address _contractor,
    uint256 _value,
    uint256 _fee
  ) external onlyHirer(_hirer)
  {
    bytes32 jobHash = getJobHash(
      _jobId,
      _hirer,
      _contractor,
      _value,
      _fee);
    //check the job exists in the contract
    require(jobEscrows[jobHash].exists);
    //check job is started
    require(jobEscrows[jobHash].status == STATUS_JOB_STARTED);
    //can only self-refund 4 weeks after agreed completion date
    require(block.timestamp > jobEscrows[jobHash].agreedCompletionDate + 4 weeks);
    //get value for job
    uint256 jobValue = hirerEscrowMap[msg.sender][jobHash];
    //Check values in contract and sent are valid
    require(jobValue > 0 && jobValue == _value);
    //check fee amount is valid
    require(jobValue >= jobValue.sub(_fee));
    //check there is enough in escrow
    require(totalInEscrow >= jobValue && totalInEscrow > 0);
    emit HirerLastResortRefund(
      jobHash,
      _hirer,
      _contractor,
      jobValue); //Log event
    delete jobEscrows[jobHash]; //no longer required. Remove to save storage.
    delete  hirerEscrowMap[_hirer][jobHash]; //no longer required. Remove to save storage.
    //update total in escrow
    totalInEscrow = totalInEscrow.sub(jobValue);
    //transfer funds to hirer
    _hirer.transfer(jobValue);
  }
}