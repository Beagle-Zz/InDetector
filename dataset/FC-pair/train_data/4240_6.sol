contract c4240{
      // @return true if all the tiers has been ended
  function saleTimeOver() public view returns (bool) {
    return now > phases[noOfPhases-1].endTime;
  }
}