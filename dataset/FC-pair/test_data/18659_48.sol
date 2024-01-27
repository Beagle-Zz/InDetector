contract c18659{
  // @dev Get the class's name.
  function getClassName(uint32 _classId)
    external view
    returns (string)
  {
    return heroClasses[_classId].className;
  }
}