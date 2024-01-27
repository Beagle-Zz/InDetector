contract c7227{
  // update hardCap for sale
  function setHardCap(uint256 _hardCap) public onlyOwner {
    require(!isFinalized);
    require(_hardCap >= 0 && _hardCap <= totalTokenSupply);
    hardCap = _hardCap;
  }
}