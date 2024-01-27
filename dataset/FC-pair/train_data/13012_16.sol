contract c13012{
  // modifier to check if called by issuer of the token
  modifier tokenIssuerOnly(address token, address owner) {
    require(currencyMap[token].owner == owner);
    _;
  }
}