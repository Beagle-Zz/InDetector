contract c2569{
  // used by ERC 223
  function tokenFallback(address _from, uint256 _value, bytes _data) external {
    require(_data.length > 0, "_data must contain the uint256 tokenId to transfer the token to.");
    require(isContract(msg.sender), "msg.sender is not a contract");
    /**************************************
    * TODO move to library
    **************************************/
    // convert up to 32 bytes of_data to uint256, owner nft tokenId passed as uint in bytes
    uint256 tokenId;
    assembly {
      tokenId := calldataload(132)
    }
    if(_data.length < 32) {
      tokenId = tokenId >> 256 - _data.length * 8;
    }
    //END TODO
    erc223Received(_from, tokenId, msg.sender, _value);
  }
}