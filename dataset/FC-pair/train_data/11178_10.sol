contract c11178{
  /**
  * @dev Determines if token exists by checking it's price
  * @param _tokenId uint256 ID of token
  */
  function tokenExists (uint256 _tokenId) public view returns (bool _exists) {
    return memeData[_tokenId].price > 0;
  }
}