contract c16590{
  // must return true if crowdsale completed successfully
  function isSuccessful()
    public
    constant
    returns(bool)
  {
    return (
      completed
    );
  }
}