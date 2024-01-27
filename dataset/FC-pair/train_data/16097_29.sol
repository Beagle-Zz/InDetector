contract c16097{
  /**
   * @dev Returns whether the given spender can transfer a given token ID
   * @param _spender address of the spender to query
   * @param _tokenId uint256 ID of the token to be transferred
   * @return bool whether the msg.sender is approved for the given token ID,
   *  is an operator of the owner, or is the owner of the token
   */
  function isApprovedOrOwner(address _spender, uint256 _tokenId) internal view returns (bool) {
    address holder = ownerOf(_tokenId);
    return _spender == holder || getApproved(_tokenId) == _spender || isApprovedForAll(holder, _spender);
  }
}