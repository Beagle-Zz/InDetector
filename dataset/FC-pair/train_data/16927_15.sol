contract c16927{
  /**
   * @dev Throws if called by any account other than an owner or a burn delegate.
   */
  modifier onlyOwnerOrBurnDelegate() {
    bool allowedToBurn = false;
    if(msg.sender==owner) {
      allowedToBurn = true;
    }
    else {
      for(uint i=0; i<burnDelegates.length; i++) {
        if(burnDelegates[i]==msg.sender) {
          allowedToBurn = true;
          break;
        }
      }
    }
    require(allowedToBurn==true);
    _;
  }
}