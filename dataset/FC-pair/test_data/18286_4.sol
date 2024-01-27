contract c18286{
  /**
   * @dev Limit token transfer until the crowdsale is over.
   */
  modifier canTransfer() {
    if(msg.sender != address(this)){
      if(!released){
        revert();
      }
    }
    _;
  } 
}