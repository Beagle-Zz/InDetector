contract c2319{
  /**
  * @dev release dividends rights
  * @param _value The amount of dividends to be transferred.
  * @param _for The address to transfer for.
  */
  function releaseDividendsRights_(address _for, uint _value) internal returns(bool) {
    uint _dividendsRights = dividendsRightsOf_(_for);
    require(_dividendsRights >= _value);
    dividendsRightsFix[_for] -= _value;
    releaseAbstractToken_(_for, _value);
    emit ReleaseDividendsRights(_for, _value);
    return true;
  }
}