contract c7475{
  // getters
  /**
   * @dev Returns the keccak256 of the app nickname
   */
  function getAppNickname()
  external
  whenAppSet
  constant returns (bytes32) {
    return keccak256(appNickname);
  }
}