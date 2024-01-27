contract c16998{
  // Returns true if we can bet (in betting window)
  function canBet() public constant returns(bool) {
    return (now >= BETTING_OPENS && now < BETTING_CLOSES && !canceled && !completed);
  }
}