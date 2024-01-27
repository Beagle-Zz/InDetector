contract c2229{
  // @return true if ico is open
  function isIcoOpen() public view returns (bool) {
    bool capReached = tokenSold >= icoCap;
    return !capReached;
  }
}