contract c3135{
  /**
   * @notice Checks whether the Goal is Reached.
   */
  function goalReached() public constant returns (bool) {
    if (tokensSold >= CAP) {
      token.transfer(tokenAddressWallet, token.balanceOf(this));
      return true;
    }
    return false;
  }
}