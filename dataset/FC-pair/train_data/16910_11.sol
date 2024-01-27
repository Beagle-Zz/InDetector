contract c16910{
  // @dev Returns when will the token become operational again and why it was frozen.
  function getFreezeUntilDetails() constant public returns(uint256 frozenUntilBlock, string notice){
    return(tokenFrozenUntilBlock, tokenFrozenUntilNotice);
  }
}