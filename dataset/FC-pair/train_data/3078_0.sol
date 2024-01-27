contract c3078{
  /**
   * to stop this contract
   */
  modifier transable(){
      require(transfersEnabled);
      _;
  }
}