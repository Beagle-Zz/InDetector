contract c7793{
  /**
   * function forwardFunds - Transfer funds to wallet
   */
  function forwardFunds() internal {
    wallet.transfer(msg.value);
  }
}