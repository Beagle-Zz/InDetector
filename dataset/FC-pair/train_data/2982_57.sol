contract c2982{
  /**
   * @dev Mint a new InterfaceToken token
   * @dev Reverts if not called by curator
   * @param _blockhash an Ethereum block hash
   * @param _tokenId unique token ID
   * @param _nickname char stamp of token owner
   */
  function mint(bytes32 _blockhash, uint256 _tokenId, bytes32 _nickname) external onlyIfWhitelisted(msg.sender) {
    require(_tokenId < purchaseTokenPointer); // ensure under number where buying tokens takes place
    _mint(_blockhash, _tokenId, _nickname, msg.sender);
  }
}