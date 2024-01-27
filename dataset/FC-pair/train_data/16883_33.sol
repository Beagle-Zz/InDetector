contract c16883{
  /**
   * @dev transfer token for a specified address
   * @dev Both the sender and the recipient should be whitelisted.
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function transfer(address _to, uint256 _value) public notPaused isWhitelistedOrFreeTransferAllowed(msg.sender) isWhitelistedOrFreeTransferAllowed(_to) returns (bool) {
    return super.transfer(_to, _value);
  }
}