contract c8614{
  /**
   * @dev modifier to ensure only the Contractor can execute
   * @param _contractor Address of the contractor to check against msg.sender
   */
  modifier onlyContractor(address _contractor) {
    require(msg.sender == _contractor);
    _;
  }
}