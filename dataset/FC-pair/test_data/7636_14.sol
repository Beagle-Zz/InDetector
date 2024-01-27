contract c7636{
  /**
    * @dev Return address available allocation
    * @param _recipient which address is applicable
    */
  function checkAvailableTokens (address _recipient) public view returns (uint256) {
    //Check if user have bought tokens
    require(buyers[_recipient]); 
    return allocationsTotal[_recipient];
  }
}