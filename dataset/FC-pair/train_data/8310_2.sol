contract c8310{
  /**
   * @dev Allows only presale or crowdsale
   */
  modifier isAuthorized() { // modifier that allows only presale or crowdsale
    require(msg.sender==authorized);
    _;
  }
}