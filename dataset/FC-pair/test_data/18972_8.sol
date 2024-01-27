contract c18972{
  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() public onlySaleAgent returns (bool) {
    mintingFinished = true;
    MintFinished();
    return true;
  }
}