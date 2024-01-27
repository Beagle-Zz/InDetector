contract c7227{
  // update token units a buyer gets per wei
  function setRate(uint256 _rate) public onlyOwner {
    require(!isFinalized);
    require(_rate > 0);
    rate = _rate;
  }
}