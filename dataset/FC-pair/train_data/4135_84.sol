contract c4135{
  // @dev Get elo rating of a player.
  function getEloRating(address _address)
    external view
    returns (uint32)
  {
    if (addressToElo[_address] != 0)
      return addressToElo[_address];
    else
      return 1500;
  }
}