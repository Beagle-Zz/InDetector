contract c3978{
  /**
   * @dev Throws if called by any account that's not whitelisted.
   */
  modifier onlyWhitelisted() {
    whitelist[msg.sender] == true;
    _;
  }
}