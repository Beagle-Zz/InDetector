contract c16097{
  /**
   * @dev Returns whether the specified token exists
   * @param _tokenId uint256 ID of the token to query the existance of
   * @return whether the token exists
   */
  function exists(uint256 _tokenId) public view returns (bool) {
    address holder = tokenOwner[_tokenId];
    return holder != address(0);
  }
}