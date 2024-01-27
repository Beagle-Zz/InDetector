contract c2018{
  /**
   * @dev Return the array of burn delegates.
   */
  function getBurnDelegates() public view returns (address[]) {
    return burnDelegates;
  }
}