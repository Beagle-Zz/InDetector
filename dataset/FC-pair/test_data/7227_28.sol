contract c7227{
  // update token units a vip buyer gets per wei
  function setVipRate(uint256 _vipRate) public onlyOwner {
    require(!isFinalized);
    require(_vipRate > 0);
    vipRate = _vipRate;
  }
}