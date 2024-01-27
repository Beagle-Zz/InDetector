contract c2977{
  /**
  * Clones Led Token at the given snapshot block
  * @param _snapshotBlock {uint256}
  * @param _name {string} - The cloned token name
  * @param _symbol {string} - The cloned token symbol
  * @return clonedTokenAddress {address}
   */
  function createCloneToken(uint256 _snapshotBlock, string _name, string _symbol) public returns(address) {
      if (_snapshotBlock == 0) {
        _snapshotBlock = block.number;
      }
      if (_snapshotBlock > block.number) {
        _snapshotBlock = block.number;
      }
      LedToken cloneToken = tokenFactory.createCloneToken(
          this,
          _snapshotBlock,
          _name,
          _symbol
        );
      cloneToken.transferControl(msg.sender);
      // An event to make the token easy to find on the blockchain
      emit NewCloneToken(address(cloneToken));
      return address(cloneToken);
    }
}