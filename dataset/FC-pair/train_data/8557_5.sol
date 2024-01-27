contract c8557{
  /**
   * @dev Throws if called by any account other than the authority or owner.
   */
  modifier onlyAuthority() {
      require(msg.sender == owner || authorities[msg.sender]);
      _;
  }
}