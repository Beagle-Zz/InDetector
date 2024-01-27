contract c4187{
  /**
    * @dev Return address available allocation
    * @param _recipient which address is applicable
    */
  function checkAvailableTokens (address _recipient) public view returns (uint256) {
    //Check if user have bought tokens
    require(buyers[_recipient]);
    uint256 _availableTokens = 0;
    if(now >= step1){
      _availableTokens = _availableTokens.add(allocations1[_recipient]);
    }
    if(now >= step2){
      _availableTokens = _availableTokens.add(allocations2[_recipient]);
    }
    if(now >= step3){
      _availableTokens = _availableTokens.add(allocations3[_recipient]);
    }
    return _availableTokens;
  }
}