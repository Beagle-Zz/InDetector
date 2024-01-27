contract c12323{
  /**
  * @dev Check if the user is whitelisted for the crowdsale.
  * @return true if user is whitelisted ; false otherwise
  **/
  function isWhitelisted(address _user)
      public
      constant
      returns (bool)
  {
      return whiteListedAddress[_user];
  }
}