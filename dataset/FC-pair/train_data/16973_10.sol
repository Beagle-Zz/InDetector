contract c16973{
  // Modifier to only allow the execution of
  // certain functions restricted to the owners
  modifier onlyOwnerLevel() {
    require(
      OWNERS == msg.sender
    );
    _;
  }
}