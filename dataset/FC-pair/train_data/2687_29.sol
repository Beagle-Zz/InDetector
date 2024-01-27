contract c2687{
  /**
   * @dev Returns the cap per a user.
   * @return Current cap for individual user
   */
  function getUserCap() public view returns (uint256) {
    return individualCap;
  }
}