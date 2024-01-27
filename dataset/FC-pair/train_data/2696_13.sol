contract c2696{
  /*
   * Allow the transfer of tokens to happen once ICO finished
   */
  function allowTransfers() onlyOwner public returns (bool) {
    transferDisabled = false;
    return true;
  }
}