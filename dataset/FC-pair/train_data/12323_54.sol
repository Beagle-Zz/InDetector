contract c12323{
  /**
  * @dev Checks if the sender is whitelisted for the presale.
  **/
  modifier onlyPresaleWhitelisted()
  {
      require(isWhitelistedPresale(msg.sender), "address is not whitelisted for presale");
      _;
  }
}