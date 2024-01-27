contract c16910{
  //@dev Returns the number of decimals the token uses - e.g. 8, means to divide the token amount by 100000000 to get its user representation.
  function tokenDecimals() constant public returns(uint8 _tokenDecimals){
    return decimals;
  }
}