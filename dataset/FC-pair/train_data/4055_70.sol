contract c4055{
  // @dev Set the required golds to level up a hero.
  function setRequiredExpIncreaseFactor(uint32 _value)
    onlyOwner
    public
  {
    requiredExpIncreaseFactor = _value;
  }
}