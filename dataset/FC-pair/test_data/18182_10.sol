contract c18182{
  /**
   * @dev Throws if called by any account other than the creator.
   */
  modifier onlyCreator() {
    require(msg.sender == creator);
    _;
  }
}