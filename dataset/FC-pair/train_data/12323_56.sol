contract c12323{
  /**
   * @dev Whitelists an array of users for the crowdsale.
   * @param _users the users to be whitelisted
   */
  function whitelistAddresses(address[] _users)
      public
      onlyOwner
  {
      for(uint i = 0 ; i < _users.length ; i++) {
        whiteListedAddress[_users[i]] = true;
      }
  }
}