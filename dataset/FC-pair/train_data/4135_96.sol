contract c4135{
  // @dev Set location id.
  function setLocationId(uint32 _value)
    onlyOwner
    public
  {
    locationId = _value;
  }
}