contract c2569{
  // @dev Throws if called by any non-operator account. Owner has all ops rights.
  modifier onlyOperator {
    require(
      isOperator[msg.sender] || msg.sender == owner,
      "Permission denied. Must be an operator or the owner.");
    _;
  }
}