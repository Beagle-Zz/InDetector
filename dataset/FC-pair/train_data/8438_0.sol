contract c8438{
  /// Access modifier for contract owner only functionality
  modifier onlyContractOwner() {
    require(msg.sender == contractOwner);
    _;
  }
}