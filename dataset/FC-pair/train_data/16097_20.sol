contract c16097{
  /**
   * @dev Gets the owner of the specified token ID
   * @param _tokenId uint256 ID of the token to query the owner of
   * @return owner address currently marked as the owner of the given token ID
   */
  function ownerOf(uint256 _tokenId) public view returns (address) {
    address holder = tokenOwner[_tokenId];
    require(holder != address(0));
    return holder;
  }
}