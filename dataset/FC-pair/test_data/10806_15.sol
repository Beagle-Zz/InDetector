contract c10806{
    /**
     * @dev Transfer the specified amount of tokens to the specified address.
     *      This function works the same with the previous one
     *      but doesn't contain `_data` param.
     *      Added due to backwards compatibility reasons.
     *
     * @param _to    Receiver address.
     * @param _value Amount of tokens that will be transferred.
     */
    function transfer(address _to, uint _value) canTransfer(msg.sender) returns (bool success) {
      require(_to != address(0));
      require(_value <= balances[msg.sender]);
      uint codeLength;
      bytes memory empty;
      assembly {
          codeLength := extcodesize(_to)
      }
      balances[msg.sender] = balances[msg.sender].sub(_value);
      balances[_to] = balances[_to].add(_value);
      if(codeLength>0) {
          ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
          receiver.tokenFallback(msg.sender, _value, empty);
      }
      Transfer(msg.sender, _to, _value);
      return true;
    }
}