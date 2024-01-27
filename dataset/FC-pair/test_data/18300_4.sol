contract c18300{
  /**
   * @dev Limit token transfer until the crowdsale is over.
   */
  modifier canTransfer() {
    if(msg.sender != address(this)){
      if(!released){
        if(!privilege){
          revert();
        }else if(!privilegedAddr[msg.sender]){
          revert();
        }
      }
    }
    _;
  } 
}