contract c7476{
  /**
   * @dev Returns the address associated to a user-id
   * @param _uid The user-id
   */
  function getAddress(
    string _uid
  )
  external
  constant returns (address)
  {
    return __addressByUid[_uid].lastAddress;
  }
}