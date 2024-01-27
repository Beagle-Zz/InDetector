contract c12323{
  /**
  * @dev Creates the talao token.
  * @return the TalaoToken address
  **/
  function createTokenContract()
      internal
      returns (MintableToken)
  {
      return new TalaoToken();
  }
}