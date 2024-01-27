contract c18496{
  // ERC223 Token improvement to send tokens to smart-contracts
  function transfer(address _to, uint _value) public returns (bool success) { 
    //standard function transfer similar to ERC20 transfer with no _data
    //added due to backwards compatibility reasons
    bytes memory empty;
    if (isContract(_to)) {
        return transferToContract(_to, _value, empty);
    }
    else {
        return super.transfer(_to, _value);
    }
  }
}