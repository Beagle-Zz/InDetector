contract c7021{
  /**
   * @dev Function to resume minting new tokens.
   * @return True if the operation was successful.
   */
  function openMinting() public onlyOwner returns (bool) {
    mintingFinished = false;
    emit MintOpened();
     return true;
  }
}