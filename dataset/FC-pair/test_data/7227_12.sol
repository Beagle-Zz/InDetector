contract c7227{
  // overriding MintableToken#transferFrom to add kyc logic
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(!kycRequired[_from]);
    return super.transferFrom(_from, _to, _value);
  }
}