contract c18710{
// creates the token to be sold. 
  // override this method to have crowdsale of a specific datum token.
  function createTokenContract() internal returns (EtherGoToken) {
    return new EtherGoToken();
}
}