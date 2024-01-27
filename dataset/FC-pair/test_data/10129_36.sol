contract c10129{
  /**
   * Because this is a presale, we do not issue any tokens yet.
   *
   * @dev Have this taken away from the parent contract?
   */
  function assignTokens(address receiver, uint tokenAmount) internal {
    revert();
  }
}