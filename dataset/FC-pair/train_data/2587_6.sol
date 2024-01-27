contract c2587{
  // Finished the current bet of a player, if they have one
  function finishBet() public
    gameIsActive
    returns (uint)
  {
    return _finishBet(true, msg.sender);
  }
}