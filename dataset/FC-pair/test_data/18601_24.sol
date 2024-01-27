contract c18601{
  /*
    If investmend was made in bitcoins etc. owner can assign apropriate amount of
    tokens to the investor.
  */
  function assignTokens(address _beneficiary, uint256 _tokensAmount) onlyAssginer public {
    _processTokensAssgin(_beneficiary, _tokensAmount);
  }
}