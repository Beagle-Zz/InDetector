contract c16401{
  // get Ids of all deeds  
  function getDeedIds()
  external view returns (uint256[]) {
    return deedIds;
  }
}