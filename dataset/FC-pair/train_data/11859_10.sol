contract c11859{
  //
  // Authorization
  //
  /**
   * @dev Authorize a third party operator to manage (send) msg.sender's asset
   * @param operator address to be approved
   * @param authorized bool set to true to authorize, false to withdraw authorization
   */
  function setApprovalForAll(address operator, bool authorized) external {
    return _setApprovalForAll(operator, authorized);
  }
}