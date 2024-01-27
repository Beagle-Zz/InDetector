contract c8716{
  /**
   * @dev Guarantees that the msg.sender is allowed to transfer NFT.
   * @param _tokenId ID of the NFT to transfer.
   */
  modifier canTransfer(
    uint256 _tokenId
  )
  {
    address owner = idToOwner[_tokenId];
    require(!isPaused && (
      owner == msg.sender
      || getApproved(_tokenId) == msg.sender
      || ownerToOperators[owner][msg.sender])
    );
    _;
  }
}