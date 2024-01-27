contract c13314{
  /* check presale is not active */
  modifier notpreSaleActive() {
    require(now <= startTime || now >= endTime);
    _;
  }
}