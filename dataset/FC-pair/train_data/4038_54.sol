contract c4038{
  // @dev Get the class's rank.
  function getClassRank(uint32 _classId)
    external view
    returns (uint8)
  {
    return heroClasses[_classId].classRank;
  }
}