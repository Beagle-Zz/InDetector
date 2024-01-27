contract c8614{
  /**
   * ---------
   * MODIFIERS
   * ---------
   */
  /**
   * @dev modifier to ensure only the Hirer can execute
   * @param _hirer Address of the hirer to check against msg.sender
   */
  modifier onlyHirer(address _hirer) {
    require(msg.sender == _hirer);
    _;
  }
}