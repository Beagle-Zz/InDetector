contract c16485{
  // Require that the caller actually has tokens to withdraw.
  modifier hasTokens(address sentFrom) {
    require(minerTokens[sentFrom] > 0);
    _;
  }
}