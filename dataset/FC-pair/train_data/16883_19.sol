contract c16883{
  /**
    * @dev Sets the address of the DistributedAutonomousExchange contract.
    * @param _address DistributedAutonomousExchange contract address.
    */
  function setDistributedAutonomousExchange(address _address) external onlyBy(owner) {
    distributedAutonomousExchange = _address;
  }
}