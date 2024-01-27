contract c12988{
  // Allow contracts to have ownership without taking full custody of the token
  // (Until voting is fully implemented)
  modifier onlyOwner() {
    if (msg.sender == address(0) || (msg.sender != owner && !contracts[msg.sender])) {
      revert(); // error for uncontrolled request
    }
    _;
  }
}