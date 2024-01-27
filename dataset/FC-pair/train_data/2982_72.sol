contract c2982{
  /**
 * @dev Return token ID of a Blockhash
 * @param _blockhash blockhash reference
 */
  function tokenIdOf(bytes32 _blockhash) public view returns (uint256 hash) {
    return blockhashToTokenId[_blockhash];
  }
}