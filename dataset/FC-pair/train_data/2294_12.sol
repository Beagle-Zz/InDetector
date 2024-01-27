contract c2294{
  //function that is called when transaction target is a contract
  function transferToContract(
    address _from,
    address _to,
    uint256 _value,
    bytes _data
  ) internal returns (bool success) 
  {
    require(moveTokens(_from, _to, _value));
    ERC223ReceiverMixin(_to).tokenFallback(_from, _value, _data);
    emit Transfer(_from, _to, _value);
    emit Transfer(_from, _to, _value, _data); // solium-disable-line arg-overflow
    return true;
  }
}