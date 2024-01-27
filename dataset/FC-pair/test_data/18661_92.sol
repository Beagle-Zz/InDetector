contract c18661{
  // @dev Set cooldown of this dungeon.
  function setCoolDungeon(uint32 _value)
    onlyOwner
    public
  {
    coolDungeon = _value;
  }
}