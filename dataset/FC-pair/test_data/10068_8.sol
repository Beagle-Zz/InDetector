contract c10068{
   /**
   * Change how many tokens given spender is allowed to transfer from message
   * spender.  In order to prevent double spending of allowance,
   * To change the approve amount you first have to reduce the addresses`
   * allowance to zero by calling `approve(_spender, 0)` if it is not
   * already 0 to mitigate the race condition described here:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender address to allow the owner of to transfer tokens from
   *        message sender
   * @param _value number of tokens to allow to transfer
   * @return true if token transfer was successfully approved, false otherwise
   */
  function approve (address _spender, uint256 _value)
    returns (bool success) {
	require(allowance (msg.sender, _spender) == 0 || _value == 0);
    return AbstractToken.approve (_spender, _value);
  }
}