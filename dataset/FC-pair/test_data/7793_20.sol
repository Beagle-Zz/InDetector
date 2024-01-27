contract c7793{
  /**
   * function hasEnded - Checks the ICO ends or not
   * @return true - ICO Ends
   */
  function hasEnded() public constant returns (bool) {
    return now > privateSaleEndTime;
  }
}