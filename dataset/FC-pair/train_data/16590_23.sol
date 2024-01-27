contract c16590{
// Here goes ICrowdsaleProcessor implementation
  // returns address of crowdsale token. The token must be ERC20-compliant
  function getToken()
    public
    returns(address)
  {
    return address(token);
  }
}