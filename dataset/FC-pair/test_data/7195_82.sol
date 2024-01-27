contract c7195{
  // @dev Set blacklist.
  function setBlacklist(uint32 _classId, bool _value)
    onlyOwner
    public
  {
    blackList[_classId] = _value;
  }
}