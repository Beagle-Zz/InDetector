contract c12321{
  /**
  * @dev Same ERC20 behavior, but require the token to be unlocked
  * @param _from address The address which you want to send tokens from.
  * @param _to address The address which you want to transfer to.
  * @param _value uint256 the amount of tokens to be transferred.
  **/
  function transferFrom(address _from, address _to, uint256 _value)
      public
      onlyMintingFinished
      returns (bool)
  {
      return super.transferFrom(_from, _to, _value);
  }
}