contract c16590{
  // must return true if crowdsale is active (i.e. the token can be bought)
  function isActive()
    public
    constant
    returns(bool)
  {
    return (
      // we remove timelines
      started && !completed
    );
  }
}