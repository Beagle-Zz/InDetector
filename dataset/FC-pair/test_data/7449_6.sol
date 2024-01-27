contract c7449{
  /**
   * Transfer given number of tokens from message sender to given recipient.
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer to the owner of given address
   * @return true if tokens were transferred successfully, false otherwise
   */
  function transfer(address _to, uint256 _value) returns (bool success) {
    require(!frozenAccount[msg.sender]);
	if (frozen) return false;
    else return AbstractToken.transfer (_to, _value);
  }
}