contract c16910{
  /*
  * @dev Returns info whether address can use the token or not.
  * @param _queryAddress address Address of the account we want to check.
  */
  function isRestrictedAddress(address _queryAddress) constant public returns(bool answer){
    return restrictedAddresses[_queryAddress];
  }
}