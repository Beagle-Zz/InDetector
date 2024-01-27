contract c11007{
  /**
   * @dev Throws if called by non-allowed contract
   */
  modifier allowedOnly() {
    require(allowed[msg.sender] || msg.sender == owner);
    _;
  }
}