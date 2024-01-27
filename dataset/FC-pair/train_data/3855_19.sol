contract c3855{
  /**
   * @dev Revoke permission to mint tokens from a mint delegate.
   * @param _mintDelegate The account to be revoked.
   */
  function revokeMintDelegate(address _mintDelegate) onlyOwner public returns (bool) {
    uint length = mintDelegates.length;
    require(length > 0);
    address lastDelegate = mintDelegates[length-1];
    if(_mintDelegate == lastDelegate) {
      delete mintDelegates[length-1];
      mintDelegates.length--;
    }
    else {
      // Game plan: find the delegate, replace it with the very last item in the array, then delete the last item
      for(uint i=0; i<length; i++) {
        if(mintDelegates[i]==_mintDelegate) {
          mintDelegates[i] = lastDelegate;
          delete mintDelegates[length-1];
          mintDelegates.length--;
          break;
        }
      }
    }
    RevokeMintDelegate(_mintDelegate);
    return true;
  }
}