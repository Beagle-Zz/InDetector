contract c7227{
  // overriding MintableToken#transfer to add kyc logic
  function transfer(address _to, uint _value) public returns (bool) {
    require(!kycRequired[msg.sender]);
    return super.transfer(_to, _value);
  }
}