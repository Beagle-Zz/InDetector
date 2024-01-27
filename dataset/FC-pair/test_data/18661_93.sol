contract c18661{
  // @dev Set cooldown of heroes entered this dungeon.
  function setCoolHero(uint32 _value)
    onlyOwner
    public
  {
    coolHero = _value;
  }
}