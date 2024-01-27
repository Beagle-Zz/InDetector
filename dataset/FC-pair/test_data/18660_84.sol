contract c18660{
  // @dev Set the price of summoning a hero with Gold.
  function setGoldPrice(uint256 _value)
    onlyOwner
    public
  {
    goldPrice = _value;
  }
}