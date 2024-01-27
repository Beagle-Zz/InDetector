contract c4135{
  // @dev Set the Exp given to the player for fighting in this arena.
  function setExpReward(uint32 _value)
    onlyOwner
    public
  {
    expReward = _value;
  }
}