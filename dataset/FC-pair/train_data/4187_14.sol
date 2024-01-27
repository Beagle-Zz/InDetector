contract c4187{
  /**
    * @dev Transfer a recipients available allocation to their address
    * @param _recipients Array of addresses to withdraw tokens for
    */
  function distributeManyTokens(address[] _recipients) onlyOwnerOrAdmin public {
    for (uint256 i = 0; i < _recipients.length; i++) {
      //Check if address is buyer 
      //And if the buyer is not already received all the tokens
      if(buyers[_recipients[i]] && !buyersReceived[_recipients[i]]){
        distributeTokens( _recipients[i]);
      }
    }
  }
}