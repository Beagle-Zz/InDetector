contract c2018{
  /**
   * @dev Throws if called by any account other than an owner or a mint delegate.
   */
  modifier onlyOwnerOrMintDelegate() {
    bool allowedToMint = false;
    if(msg.sender==owner) {
      allowedToMint = true;
    }
    else {
      for(uint i=0; i<mintDelegates.length; i++) {
        if(mintDelegates[i]==msg.sender) {
          allowedToMint = true;
          break;
        }
      }
    }
    require(allowedToMint==true);
    _;
  }
}