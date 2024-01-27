contract c16217{
  //check if the sender is an authorized casino wallet
  modifier onlyAuthorized {
    require(casino.authorized(msg.sender));
    _;
  }
}