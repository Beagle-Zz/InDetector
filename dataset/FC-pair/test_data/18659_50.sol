contract c18659{
  // @dev Get the heroes ever minted for the class.
  function getClassMintCount(uint32 _classId)
    external view
    returns (uint32)
  {
    return heroClasses[_classId].currentNumberOfInstancedHeroes;
  }
}