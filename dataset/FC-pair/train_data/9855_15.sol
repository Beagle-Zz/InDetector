contract c9855{
    /**
     * @dev This method can be called if you are the token owner and you want to transfer the token to someone else.
     * @param _to - new KT owner
     * @param _tokenId - just token id
     */
  function transfer(address _to, uint256 _tokenId) public whenNotFrozen(_tokenId) onlyOwnerOf(_tokenId) hasKT(_tokenId){
    require(_to != address(0));
    _transfer(msg.sender, _to, _tokenId);
  }
}