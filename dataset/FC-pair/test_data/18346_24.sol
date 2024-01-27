contract c18346{
  // Token Deployment
  // =================
  function createTokenContract() internal returns (MintableToken) {
    return new TokenContract();  // binding thr token contract to this crowdsale
  }
}