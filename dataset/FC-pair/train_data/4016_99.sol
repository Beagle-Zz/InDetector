contract c4016{
  // @dev Set the Golds given to the player for fighting in this arena.
  function setGoldReward(uint256 _value)
    onlyOwner
    public
  {
    goldReward = _value;
  }
}