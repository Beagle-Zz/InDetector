contract c3815{
  /**
    * sets slave wallet percentage
    * @param newSlaveWalletPercent new wallet percentage
    */
  function setSlaveWalletPercent(uint newSlaveWalletPercent) public onlyOwner {
    require(!slaveWalletPercentInitialized);
    slaveWalletPercent = newSlaveWalletPercent;
    slaveWalletPercentInitialized = true;
  }
}