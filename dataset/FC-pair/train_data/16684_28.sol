contract c16684{
  /// @dev Resolve the contract umambigious state
  function getState() public constant returns(State) {
    if(lockedAt == 0) {
      return State.Loading;
    } else if(now > freezeEndsAt) {
      return State.Distributing;
    } else {
      return State.Holding;
    }
  }
}