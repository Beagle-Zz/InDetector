contract c8614{
  /**
   * @dev Called when both hirer and contractor have agreed on cancellation conditions, and amount each will receive
   * can be called by hirer or contractor once % amount has been signed by both parties.
   * Both parties sign a hash of the % agreed upon. The signatures of both parties must be sent and verified
   * before the transaction is processed, to ensure that the % processed is valid.
   * can be called at any time
   * @param _jobId The unique ID of the job, from the CoinSparrow database
   * @param _hirer The wallet address of the hiring (buying) party
   * @param _contractor The wallet address of the contractor (selling) party
   * @param _value The ether amount being held in escrow. I.e. job cost - amount hirer is paying contractor
   * @param _fee CoinSparrow fee for this job. Pre-calculated
   * @param _contractorPercent percentage the contractor will be paid
   * @param _hirerMsgSig Signed message from hiring party agreeing on _contractorPercent
   * @param _contractorMsgSig Signed message from contractor agreeing on _contractorPercent
   */
  function processMutuallyAgreedJobCancellation(
    bytes16 _jobId,
    address _hirer,
    address _contractor,
    uint256 _value,
    uint256 _fee,
    uint8 _contractorPercent,
    bytes _hirerMsgSig,
    bytes _contractorMsgSig
  ) external
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
    require(msg.sender == _hirer || msg.sender == _contractor);
    require(_contractorPercent <= 100 && _contractorPercent >= 0);
    //Checks the signature of both parties to ensure % is correct.
    //Attempts to prevent the party calling the function from modifying the pre-agreed %
    require(
      checkRefundSignature(_contractorPercent,_hirerMsgSig,_hirer)&&
      checkRefundSignature(_contractorPercent,_contractorMsgSig,_contractor));
    uint256 jobValue = hirerEscrowMap[_hirer][jobHash];
    //Check values in contract and sent are valid
    require(jobValue > 0 && jobValue == _value);
    //check fee amount is valid
    require(jobValue >= jobValue.sub(_fee));
    //check there is enough in escrow
    require(totalInEscrow >= jobValue && totalInEscrow > 0);
    totalInEscrow = totalInEscrow.sub(jobValue);
    feesAvailableForWithdraw = feesAvailableForWithdraw.add(_fee);
    delete jobEscrows[jobHash];
    delete  hirerEscrowMap[_hirer][jobHash];
    uint256 contractorAmount = jobValue.sub(_fee).mul(_contractorPercent).div(100);
    uint256 hirerAmount = jobValue.sub(_fee).mul(100 - _contractorPercent).div(100);
    emit MutuallyAgreedCancellation(
      jobHash,
      msg.sender,
      hirerAmount,
      contractorAmount);
    emit AddFeesToCoinSparrowPool(jobHash, _fee);
    if (contractorAmount > 0) {
      _contractor.transfer(contractorAmount);
    }
    if (hirerAmount > 0) {
      _hirer.transfer(hirerAmount);
    }
  }
}