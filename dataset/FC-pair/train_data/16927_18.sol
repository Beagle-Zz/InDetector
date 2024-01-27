contract c16927{
  /**
   * @dev Give a mint delegate permission to mint tokens.
   * @param _mintDelegate The account to be approved.
   */
  function approveMintDelegate(address _mintDelegate) onlyOwner public returns (bool) {
    bool delegateFound = false;
    for(uint i=0; i<mintDelegates.length; i++) {
      if(mintDelegates[i]==_mintDelegate) {
        delegateFound = true;
        break;
      }
    }
    if(!delegateFound) {
      mintDelegates.push(_mintDelegate);
    }
    ApproveMintDelegate(_mintDelegate);
    return true;
  }
}