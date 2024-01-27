contract c3291{
  // Total tokens sold duing the presale and public sale.
  // Total tokens has to divided by 10^18
  function totalTokens() public constant returns(uint256) {
    return tokensSold;
  }
}