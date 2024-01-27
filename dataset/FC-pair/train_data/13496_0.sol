contract c13496{
  //Allow transfers from owner even in paused state - block all others
  modifier whenNotPaused() {
    require(!paused || msg.sender == owner);
    _;
  }
}