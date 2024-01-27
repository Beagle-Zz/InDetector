contract c18496{
  //function that is called when transaction target is a contract
  function transferToContract(address _to, uint _value, bytes _data) private returns (bool success) {
    return approveAndCall(_to, _value, _data);
  }
}