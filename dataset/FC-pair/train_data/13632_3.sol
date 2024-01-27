contract c13632{
  /* For players */
  // anyone can withdraw on behalf of someone (when the player lacks the gas, for instance)
  function withdrawToMany (address[] players) public {
    for (uint8 x = 0; x < players.length; x++) {
      address player = players[x];
      withdrawTo(player);
    }
  }
}