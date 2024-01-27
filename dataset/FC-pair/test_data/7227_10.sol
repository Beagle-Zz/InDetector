contract c7227{
  // overriding MintableToken#mint to add kyc logic
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    kycRequired[_to] = true;
    return super.mint(_to, _amount);
  }
}