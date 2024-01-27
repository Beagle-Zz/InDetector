contract c18660{
  // @dev Set the price of summong a hero with Mileage Points.
  function setMileagePointPrice(uint256 _value)
    onlyOwner
    public
  {
    mileagePointPrice = _value;
  }
}