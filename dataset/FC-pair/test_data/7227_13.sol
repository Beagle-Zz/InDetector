contract c7227{
  // creates the token to be sold.
  function createTokenContract() internal returns (OAKToken) {
    OAKToken newToken = new OAKToken();
    CrowdSaleTokenContractCreation();
    return newToken;
  }
}