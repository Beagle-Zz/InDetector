contract c2977{
  /**
   * Lock the minting of Led Tokens - to be called after the presale
   * @return {bool} success
  */
  function finishMinting() public onlyController returns (bool) {
    mintingFinished = true;
    emit MintFinished();
    return true;
  }
}