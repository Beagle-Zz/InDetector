contract c13832{
  /**
  * Check if address is a valid destination to transfer tokens to
  * - must not be zero address
  * - must not be the token address     
  * - must not be the admin's address
  * - must not be the token offering contract address
  */
  modifier validDestination(address to) {
    require(to != address(0x0));
    require(to != address(this));
    require(to != owner);
    require(to != address(adminAddr));
    _;
  }
}