contract c11658{
    // never call this from a contract
    /// @param _owner The owner whose tokens we are interested in.
    function narcosByOwner(address _owner) public view returns(uint256[] ownedNarcos) {
       uint256 tokenCount = ownershipTokenCount[_owner];
        uint256 totalNarcos = narcos.length - 1;
        uint256[] memory result = new uint256[](tokenCount);
        uint256 narcoId;
        uint256 resultIndex=0;
        for (narcoId = 0; narcoId <= totalNarcos; narcoId++) {
          if (narcoIndexToOwner[narcoId] == _owner) {
            result[resultIndex] = narcoId;
            resultIndex++;
          }
        }
        return result;
    }
}