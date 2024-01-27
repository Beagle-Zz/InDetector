contract c7475{
  /**
 * @dev Returns the timestamp of last update by user-id
 * @param _uid The user-id
 */
  function getUidLastUpdate(
    string _uid
  )
  external
  constant returns (uint)
  {
    return __addressByUid[_uid].lastUpdate;
  }
}