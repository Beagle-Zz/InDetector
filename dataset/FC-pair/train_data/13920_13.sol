contract c13920{
  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() canMint public returns (bool) {
    mintingFinished = true;
    emit MintFinished();
    return true;
  }
}