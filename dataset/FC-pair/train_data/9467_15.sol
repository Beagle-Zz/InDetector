contract c9467{
    /**
     * @dev the private helper function for transfering ownership.
     * @param _from - current KT owner
     * @param _to - new KT owner
     * @param _tokenId - just token id
     */
  function _transfer(address _from, address _to, uint256 _tokenId) private hasKT(_tokenId) {
    ownerKTCount[_to] = ownerKTCount[_to].add(1);
    ownerKTCount[msg.sender] = ownerKTCount[msg.sender].sub(1);
    KTToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }
}