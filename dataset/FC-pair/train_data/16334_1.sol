contract c16334{
  // Require that the caller actually has tokens to withdraw.
  modifier hasTokens() {
    require(minerTokens[msg.sender] > 0);
    _;
  }
}