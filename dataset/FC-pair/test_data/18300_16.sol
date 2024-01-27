contract c18300{
  /**
   * @dev One way function to release the tokens to the wild. Can be called only from the release agent that is the final ICO contract. 
   */
  function releaseTokenTransfer() public onlyCrowdsaleAgent {
    released = true;
  }
}