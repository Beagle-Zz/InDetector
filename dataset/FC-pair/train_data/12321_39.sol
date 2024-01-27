contract c12321{
  /**
  * @dev Same ERC20 behavior, but require the token to be unlocked
  * @param _spender address The address that will spend the funds.
  * @param _value uint256 The amount of tokens to be spent.
  **/
  function approve(address _spender, uint256 _value)
      public
      onlyMintingFinished
      returns (bool)
  {
      return super.approve(_spender, _value);
  }
}