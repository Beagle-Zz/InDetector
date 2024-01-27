contract c18337{
  /**
   * @dev Send `_value` tokens to `_to` from your account
   *
   * @param _to The address of the recipient
   * @param _value the amount to send
   */
  function transfer(address _to, uint256 _value) public returns (bool success) {
    // Require that the sender is not restricted
    require(restrictedAddresses[msg.sender] == false);
    updateAccount(_to);
    updateAccount(msg.sender);
    return super.transfer(_to, _value);
  }
}