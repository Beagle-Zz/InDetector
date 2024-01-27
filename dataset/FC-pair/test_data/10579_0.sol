contract c10579{
  /// @dev Access modifier for manager-only functionality
  modifier onlyManager() {
    require(msg.sender == managerAddress);
    _;
  }
}