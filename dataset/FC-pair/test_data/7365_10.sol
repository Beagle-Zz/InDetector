contract c7365{
  /**
   * @notice Instead of sending byte string for the transaction data, string type is used for more detailed description.
   * @dev ERC223 transfer function 
   * @param _to Address of token receiver
   * @param _value Number of tokens to send
   * @param _data information for the transaction
   */ 
  function transfer(address _to, uint _value, bytes _data) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender] && balances[_to] + _value >= balances[_to]);
    if(isContract(_to)) {
        ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
    }
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit ERC223Transfer(msg.sender, _to, _value, _data);
    return true;
    }
}