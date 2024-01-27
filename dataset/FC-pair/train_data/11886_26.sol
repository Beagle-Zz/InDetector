contract c11886{
  // ERC20 Methods
  function transfer(address to, uint256 value) public validDestination(to) isTradeable returns (bool) {
    return super.transfer(to, value);
  }
}