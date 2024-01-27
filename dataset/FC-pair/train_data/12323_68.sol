contract c12323{
  /**
  * @dev Check if the user is whitelisted for the presale.
  * @return true if user is whitelisted ; false otherwise
  **/
  function isWhitelistedPresale(address _user)
      public
      constant
      returns (bool)
  {
      return whiteListedAddressPresale[_user];
  }
}