contract c7636{
  /**
    * @dev Transfer a recipients available allocation to _recipient
    *
    */
  function distributeTokens(address _recipient) public {
    //Check have bought tokens
    require(buyers[_recipient]);
    //If all tokens are received, add _recipient to buyersReceived
    //To prevent the loop to fail if user allready used the withdrawTokens 
    buyersReceived[_recipient] = true;
    uint256 _availableTokens = allocationsTotal[_recipient];
    //Check if contract has tokens
    require(token.balanceOf(this)>=_availableTokens);
    //Transfer tokens
    require(token.transfer(_recipient, _availableTokens));
    //Add claimed tokens to totalClaimed
    totalClaimed[_recipient] = totalClaimed[_recipient].add(_availableTokens);
    //Add claimed tokens to grandTotalClaimed
    grandTotalClaimed = grandTotalClaimed.add(_availableTokens);
    //Reset allocation
    allocationsTotal[_recipient] = 0;
    emit LogTokenClaimed(_recipient, _availableTokens, allocationsTotal[_recipient], grandTotalClaimed);
  }
}