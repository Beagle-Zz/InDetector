contract c16698{
  //Was it sold out or sale overdue
  function hasEnded() public view returns (bool) {
    bool hardCapReached = weiRaised >= hardCap; // valid cap
    return hardCapReached || afterEnded();
  }
}