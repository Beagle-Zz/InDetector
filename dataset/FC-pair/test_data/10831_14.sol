contract c10831{
  /**
     * @dev Transfer the specified amount of tokens to the specified address.
     *      Invokes the `tokenFallback` function if the recipient is a contract.
     *      The token transfer fails if the recipient is a contract
     *      but does not implement the `tokenFallback` function
     *      or the fallback function to receive funds.
     *
     * @param _to    Receiver address.
     * @param _value Amount of tokens that will be transferred.
     * @param _data  Transaction metadata.
     */
    function transfer(address _to, uint _value, bytes _data) canTransfer(msg.sender) returns (bool success) {
      require(_to != address(0));
      require(_value <= balances[msg.sender]);
      uint codeLength;
      assembly {
          codeLength := extcodesize(_to)
      }
      balances[msg.sender] = balances[msg.sender].sub(_value);
      balances[_to] = balances[_to].add(_value);
      if(codeLength>0) {
          ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
          receiver.tokenFallback(msg.sender, _value, _data);
      }
      Transfer(msg.sender, _to, _value, _data);
      return true;
    }
}