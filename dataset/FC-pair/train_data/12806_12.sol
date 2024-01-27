contract c12806{
  /**
  * @notice Gets the owner of the specified token ID
  * @param _tokenId uint256 ID of the token to query the owner of
  * @return owner address currently marked as the owner of the given token ID
  */
  function ownerOf(uint256 _tokenId) public view returns (address) {
    address _owner = tokenOwnerAndTokensIndex[_tokenId].owner;
    require(_owner != address(0), "invalid owner");
    return _owner;
  }
}