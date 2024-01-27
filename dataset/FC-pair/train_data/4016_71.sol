contract c4016{
  // @dev Set the required golds to level up a hero.
  function setRequiredGoldIncreaseFactor(uint256 _value)
    onlyOwner
    public
  {
    requiredGoldIncreaseFactor = _value;
  }
}