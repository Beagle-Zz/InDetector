contract c7789{
  /**
   * @dev Removes a NFT from an address.
   * @notice Use and override this function with caution. Wrong usage can have serious consequences.
   * @param _from Address from wich we want to remove the NFT.
   * @param _tokenId Which NFT we want to remove.
   */
  function removeNFToken(
    address _from,
    uint256 _tokenId
  )
   internal
  {
    super.removeNFToken(_from, _tokenId);
    assert(ownerToIds[_from].length > 0);
    uint256 tokenToRemoveIndex = idToOwnerIndex[_tokenId];
    uint256 lastTokenIndex = ownerToIds[_from].length.sub(1);
    uint256 lastToken = ownerToIds[_from][lastTokenIndex];
    ownerToIds[_from][tokenToRemoveIndex] = lastToken;
    ownerToIds[_from][lastTokenIndex] = 0;
    ownerToIds[_from].length--;
    idToOwnerIndex[_tokenId] = 0;
    idToOwnerIndex[lastToken] = tokenToRemoveIndex;
  }
}