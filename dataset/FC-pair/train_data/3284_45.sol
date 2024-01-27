contract c3284{
  // total cap of the presale and public sale
  function totalCap() public constant returns(uint256) {
    uint256 presaleCap = super.totalCap();
    return presaleCap.add(cap);
  }
}