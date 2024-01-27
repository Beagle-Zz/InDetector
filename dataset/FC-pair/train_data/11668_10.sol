contract c11668{
  /// This is a modifier for functions to check if the sending user address is the same as the admin user address.
  modifier isAdmin() {
      require(msg.sender == admin);
      _;
  }
}