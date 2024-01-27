contract c11657{
  // never call this from a contract
  /// @param _loc that we are interested in
  function narcosByDistrict(uint8 _loc) public view returns(uint256[] narcosHere) {
    uint256 tokenCount = numberOfNarcosByDistrict(_loc);
    uint256 totalNarcos = narcoCore.totalSupply();
    uint256[] memory result = new uint256[](tokenCount);
    uint256 narcoId;
    uint256 resultIndex = 0;
    for (narcoId = 0; narcoId <= totalNarcos; narcoId++) {
      if (getNarcoLocation(narcoId) == _loc) {
        result[resultIndex] = narcoId;
        resultIndex++;
      }
    }
    return result;
  }
}