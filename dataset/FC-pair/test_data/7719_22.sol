contract c7719{
  /**
   * @dev Owner can transfer other tokens that are sent here by mistake
   * 
   */
  function refundOtherTokens(address _recipient, ERC20 _token)  onlyOwner public {
    require(_token != this);
    uint256 balance = _token.balanceOf(this);
    require(_token.transfer(_recipient, balance));
  }
}