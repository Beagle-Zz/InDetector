contract c2693{
  /**
   * @dev Returns a list of all tokens assigned to an address.
   * @param _owner The owner whose tokens we are interested in
   * @notice This method MUST NEVER be called by smart contract code. First, it's fairly
   *         expensive (it walks the entire token array looking for tokens belonging to owner),
   *         but it also returns a dynamic array, which is only supported for web3 calls, and
   *         not contract-to-contract calls.
   */
  function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
    uint256 tokenCount = balanceOf(_owner);
    if (tokenCount == 0) {
      // Return an empty array
      return new uint256[](0);
    } else {
      uint256[] memory result = new uint256[](tokenCount);
      uint256 totalTokens = totalSupply();
      uint256 resultIndex = 0;
      uint256 tokenId;
      for (tokenId = 0; tokenId <= totalTokens; tokenId++) {
        if (tokenIndexToOwner[tokenId] == _owner) {
          result[resultIndex] = tokenId;
          resultIndex++;
        }
      }
      return result;
    }
  }
}