contract c2814{
  // confirm if The Token Sale has finished
  function tokenSaleHasFinished() public view returns (bool) {
    return now > closingTime;
  }
}