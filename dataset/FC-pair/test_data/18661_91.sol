contract c18661{
  // @dev Set location id.
  function setLocationId(uint32 _value)
    onlyOwner
    public
  {
    locationId = _value;
  }
}