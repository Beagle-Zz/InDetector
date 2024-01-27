contract c11927{
    // Transfer a Wonder owned by another address, for which the calling address
    // has previously been granted transfer approval by the owner.
    function takeOwnership(uint256 _tokenId) public {
    require(wonderIndexToApproved[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
    emit Transfer(owner, msg.sender, _tokenId);
  }
}