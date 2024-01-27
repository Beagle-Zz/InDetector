contract c16927{
  /**
   * @dev Revoke permission to burn tokens from a burn delegate.
   * @param _burnDelegate The account to be revoked.
   */
  function revokeBurnDelegate(address _burnDelegate) onlyOwner public returns (bool) {
    uint length = burnDelegates.length;
    require(length > 0);
    address lastDelegate = burnDelegates[length-1];
    if(_burnDelegate == lastDelegate) {
      delete burnDelegates[length-1];
      burnDelegates.length--;
    }
    else {
      // Game plan: find the delegate, replace it with the very last item in the array, then delete the last item
      for(uint i=0; i<length; i++) {
        if(burnDelegates[i]==_burnDelegate) {
          burnDelegates[i] = lastDelegate;
          delete burnDelegates[length-1];
          burnDelegates.length--;
          break;
        }
      }
    }
    RevokeBurnDelegate(_burnDelegate);
    return true;
  }
}