contract c7828{
  /**
   * @dev Throws if called by any account other than the issuer.
   */
  modifier onlyIssuer() {
    require(msg.sender == issuer);
    _;
  }
}