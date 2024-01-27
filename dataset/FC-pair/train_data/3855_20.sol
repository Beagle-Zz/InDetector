contract c3855{
  /**
   * @dev Give a burn delegate permission to burn tokens.
   * @param _burnDelegate The account to be approved.
   */
  function approveBurnDelegate(address _burnDelegate) onlyOwner public returns (bool) {
    bool delegateFound = false;
    for(uint i=0; i<burnDelegates.length; i++) {
      if(burnDelegates[i]==_burnDelegate) {
        delegateFound = true;
        break;
      }
    }
    if(!delegateFound) {
      burnDelegates.push(_burnDelegate);
    }
    ApproveBurnDelegate(_burnDelegate);
    return true;
  }
}