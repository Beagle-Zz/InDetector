contract c8614{
  /**
   * @dev Generates the sha256 jobHash based on job parameters. Used in several functions
   * @param _jobId The unique ID of the job, from the CoinSparrow database
   * @param _hirer The wallet address of the hiring (buying) party
   * @param _contractor The wallet address of the contractor (selling) party
   * @param _value The ether amount being held in escrow. I.e. job cost - amount hirer is paying contractor
   * @param _fee CoinSparrow fee for this job. Pre-calculated
   * @return bytes32 the calculated jobHash value
   */
  function getJobHash(
    bytes16 _jobId,
    address _hirer,
    address _contractor,
    uint256 _value,
    uint256 _fee
  )  private pure returns(bytes32)
  {
    return keccak256(abi.encodePacked(
      _jobId,
      _hirer,
      _contractor,
      _value,
      _fee));
  }
}