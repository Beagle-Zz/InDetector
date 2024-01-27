contract c12233{
  /*
     Here goes ICrowdsaleProcessor methods implementation
  */
  // Returns address of crowdsale token
  function getToken()
    public
    returns (address)
  {
    return address(token);
  }
}