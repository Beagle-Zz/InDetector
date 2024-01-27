contract c7076{
  // Modifier for accessibility to add deposit.
  modifier onlyAccessDeposit {
    require(msg.sender == owner || depositAccess[msg.sender] == true);
    _;
  }
}