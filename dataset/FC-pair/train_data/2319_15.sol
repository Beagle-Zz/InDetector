contract c2319{
  /**
  * @dev release dividends rights
  * @param _value The amount of dividends to be transferred.
  */
  function releaseDividendsRights(uint _value) external returns(bool) {
    return releaseDividendsRights_(msg.sender, _value);
  }
}