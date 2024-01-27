contract c13000{
  // modifier to check if called by issuer of the token
  modifier tokenIssuerOnly(address token, address owner) {
    require(currencyMap[token].owner == owner);
    _;
  }
}