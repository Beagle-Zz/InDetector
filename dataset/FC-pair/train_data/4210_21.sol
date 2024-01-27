contract c4210{
  /**
   * @dev Function to resume Distributing new tokens.
   */
  function openDistribution() public onlyOwner {
    distributionFinished = false;
    emit DistributeOpened();
  }
}