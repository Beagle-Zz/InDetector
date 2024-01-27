contract c18346{
  // ==================
  // Change the current rate
  function setCurrentRate(uint256 _rate)  public onlyOwner {
      rate = _rate;
  }
}