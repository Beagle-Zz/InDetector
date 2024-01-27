contract c14386{
  // Filter invalid address
  modifier validAddress(address addr) {
    require(addr != address(0x0));
    require(addr != address(this));
    _;
  }
}