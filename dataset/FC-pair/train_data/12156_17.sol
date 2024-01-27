contract c12156{
  /**
   * @dev Function to resume minting new tokens.
   * @return True if the operation was successful.
   */
  function resumeMinting() onlyOwner canNotMint public returns (bool) {
    mintingFinished = false;
    emit MintResumed();
    return true;
  }
}