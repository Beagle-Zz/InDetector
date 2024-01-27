contract c2319{
  /**
  * @dev Gets the dividends rights of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint representing the amount of dividends rights owned by the passed address.
  */
  function dividendsRightsOf(address _owner) external view returns (uint) {
    return dividendsRightsOf_(_owner);
  }
}