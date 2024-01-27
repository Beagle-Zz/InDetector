contract c13843{
  //function that is called when transaction target is a contract
  function contractFallback(address _origin, address _to, uint _value, bytes _data) private returns (bool success) {
    ERC223Receiver receiver = ERC223Receiver(_to);
    return receiver.tokenFallback(msg.sender, _origin, _value, _data);
  }
}