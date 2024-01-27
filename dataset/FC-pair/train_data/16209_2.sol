contract c16209{
  /**
   * @dev Throws if called by any account other than the authorized.
   */
  modifier onlyAuthorized() {
    require(authorized[msg.sender]);
    _;
  }
}