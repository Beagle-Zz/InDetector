contract c12124{
  // modifier for functions that can only be accessed by the contract creator
  modifier onlyOwner () {
    require (msg.sender == owner);
    _;
  }
}