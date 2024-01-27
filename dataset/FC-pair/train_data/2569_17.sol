contract c2569{
  // implementation of ERC 223
  function transferERC223(uint256 _tokenId, address _to, address _erc223Contract, uint256 _value, bytes _data) external {
    address tokenOwner = tokenIdToTokenOwner[_tokenId];
    require(_to != address(0));
    address rootOwner = _ownerOf(_tokenId);
    require(
      rootOwner == msg.sender || tokenOwnerToOperators[rootOwner][msg.sender] ||
      rootOwnerAndTokenIdToApprovedAddress[rootOwner][_tokenId] == msg.sender ||
      tokenOwner == msg.sender || tokenOwnerToOperators[tokenOwner][msg.sender]);
    removeERC223(_tokenId, _erc223Contract, _value);
    require(ERC20AndERC223(_erc223Contract).transfer(_to, _value, _data), "ERC223 transfer failed.");
    emit TransferERC20(_tokenId, _to, _erc223Contract, _value);
  }
}