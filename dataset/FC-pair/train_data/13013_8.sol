contract c13013{
  // Standard function transfer similar to ERC20 transfer with no _data .
  // Added due to backwards compatibility reasons .
  function transfer(address _to, uint _value) public returns (bool success) {
    require(_value > 0
            && frozenAccount[msg.sender] == false
            && frozenAccount[_to] == false
            && now > unlockUnixTime[msg.sender]
            && now > unlockUnixTime[_to]);
    //standard function transfer similar to ERC20 transfer with no _data
    //added due to backwards compatibility reasons
    bytes memory empty;
    if(isContract(_to)) {
        return transferToContract(_to, _value, empty);
    }
    else {
        return transferToAddress(_to, _value, empty);
    }
  }
}