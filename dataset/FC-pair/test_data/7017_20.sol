contract c7017{
  /**
   * @dev Mints a new NFT.
   * @notice This is a private function which should be called from user-implemented external
   * mint function. Its purpose is to show and properly initialize data structures when using this
   * implementation.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   */
  function _mint(
    address _to,
    uint256 _tokenId
  )
    internal
  {
    require(_to != address(0));
    require(_tokenId != 0);
    require(idToOwner[_tokenId] == address(0));
    addNFToken(_to, _tokenId);
    emit Transfer(address(0), _to, _tokenId);
  }
}