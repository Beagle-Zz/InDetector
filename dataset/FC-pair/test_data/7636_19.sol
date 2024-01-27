contract c7636{
  // Owner can transfer tokens that are sent here by mistake
  function refundTokens(address _recipient, ERC20 _token) public onlyOwner {
    uint256 balance = _token.balanceOf(this);
    require(_token.transfer(_recipient, balance));
  }
}