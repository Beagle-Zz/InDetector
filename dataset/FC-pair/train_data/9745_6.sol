contract c9745{
  /**
   * @dev Reverts if called by any account other than the owner, depositor, or beneficiary.
   */
  modifier checkAuthorizedUser() {
    require(msg.sender == owner || msg.sender == depositor || msg.sender == beneficiary, "Only authorized users may call this function.");
    _;
  }
}