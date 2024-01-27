contract c12321{
  /**
  * @dev Same ERC20 behavior, but require the token to be unlocked and sells some tokens to refill ether balance up to minBalanceForAccounts
  * @param _to address The address to transfer to.
  * @param _value uint256 The amount to be transferred.
  **/
  function transfer(address _to, uint256 _value)
      public
      onlyMintingFinished
      returns (bool result)
  {
      return super.transfer(_to, _value);
  }
}