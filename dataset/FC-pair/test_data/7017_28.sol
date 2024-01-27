contract c7017{
  /**
   * @dev Assignes a new NFT to an address.
   * @notice Use and override this function with caution. Wrong usage can have serious consequences.
   * @param _to Address to wich we want to add the NFT.
   * @param _tokenId Which NFT we want to add.
   */
  function addNFToken(
    address _to,
    uint256 _tokenId
  )
    internal
  {
    super.addNFToken(_to, _tokenId);
    uint256 length = ownerToIds[_to].length;
    ownerToIds[_to].push(_tokenId);
    idToOwnerIndex[_tokenId] = length;
  }
}