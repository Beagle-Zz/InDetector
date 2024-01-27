contract c4016{
  // @dev Set cooldown of heroes entered this arena.
  function setCoolHero(uint32 _value)
    onlyOwner
    public
  {
    coolHero = _value;
  }
}