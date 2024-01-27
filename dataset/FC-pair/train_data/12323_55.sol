contract c12323{
  /**
  * @dev Checks if the sender is whitelisted for the crowdsale.
  **/
  modifier onlyWhitelisted()
  {
      require(isWhitelisted(msg.sender) || isWhitelistedPresale(msg.sender),
              "address is not whitelisted for sale");
      _;
  }
}