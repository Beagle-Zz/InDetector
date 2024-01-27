contract c4135{
  // @dev Set cooldown of heroes entered this arena.
  function setCoolHero(uint32 _value)
    onlyOwner
    public
  {
    coolHero = _value;
  }
}