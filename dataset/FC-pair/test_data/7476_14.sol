contract c7476{
  /**
   * @dev Returns the user-id associated to a wallet
   * @param _address The address of the wallet
   */
  function getUid(
    address _address
  )
  public
  constant returns (string)
  {
    return __uidByAddress[_address].lastUid;
  }
}