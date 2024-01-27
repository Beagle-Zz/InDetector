contract c16910{
  // @dev Modifier to check if the token is operational at the moment.
  modifier unfrozenToken{
    require(block.number >= blockLock || msg.sender == owner);
    require(block.number >= tokenFrozenUntilBlock);
    require(block.number <= tokenFrozenSinceBlock);
    _;
  }
}