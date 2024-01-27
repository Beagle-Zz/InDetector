contract c10234{
  //this function will never be used in production env.
  function setNow(uint _now) public onlyOwner {
    fakeNow = _now;
  }
}