contract c16729{
  /**
   * @dev Reverts if in crowdsale time range.
   */
  modifier onlyWhileClose {
    // solium-disable-next-line security/no-block-members
    require(block.timestamp >=  closingTime);
    _;
  }
}