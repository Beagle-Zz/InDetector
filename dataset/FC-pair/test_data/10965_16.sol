contract c10965{
  /**
   * When token is released to be transferable, enforce no new tokens can be created.
   */
  function releaseTokenTransfer() public onlyReleaseAgent {
    super.releaseTokenTransfer();
  }
}