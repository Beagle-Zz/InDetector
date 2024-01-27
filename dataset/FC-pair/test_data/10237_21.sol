contract c10237{
  /**
   * @dev get contract balance
   */
  function getBalance() view public returns (uint) {
    return address(this).balance;
  }
}