contract c347{
  /**
   * @dev Checks whether the period in which the crowdsale is open.
   * @return Whether crowdsale period has opened
   */
  function hasOpened() public view returns (bool) {
    // solium-disable-next-line security/no-block-members
    return (openingTime < block.timestamp && block.timestamp < closingTime);
  }
}