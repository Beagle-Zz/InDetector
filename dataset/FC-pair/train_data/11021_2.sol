contract c11021{
  //transfer modifier
  modifier canTransfer() {
    if (transferLock) {
      revert();
    }
    _;
  }
}