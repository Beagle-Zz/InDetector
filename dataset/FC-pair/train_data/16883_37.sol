contract c16883{
  /**
   * @dev Transfer tokens from one address to another
   * @dev Both the sender and the recipient should be whitelisted.
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public notPaused isWhitelistedOrFreeTransferAllowed(_from) isWhitelistedOrFreeTransferAllowed(_to) returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }
}