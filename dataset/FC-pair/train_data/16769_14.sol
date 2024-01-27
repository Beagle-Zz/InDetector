contract c16769{
  /// @param _owner The owner whose celebrity tokens we are interested in.
  /// @dev This method MUST NEVER be called by smart contract code. First, it's fairly
  ///  expensive (it walks the entire danks array looking for danks belonging to owner),
  ///  but it also returns a dynamic array, which is only supported for web3 calls, and
  ///  not contract-to-contract calls.
  function tokensOfOwner(address _owner) public view returns(uint256[] ownerTokens) {
    uint256 tokenCount = balanceOf(_owner);
    if (tokenCount == 0) {
        // Return an empty array
      return new uint256[](0);
    } else {
      uint256[] memory result = new uint256[](tokenCount);
      uint256 totaldanks = totalSupply();
      uint256 resultIndex = 0;
      uint256 dankId;
      for (dankId = 0; dankId <= totaldanks; dankId++) {
        if (dankIndexToOwner[dankId] == _owner) {
          result[resultIndex] = dankId;
          resultIndex++;
        }
      }
      return result;
    }
  }
}