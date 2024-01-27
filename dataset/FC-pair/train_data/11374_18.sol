contract c11374{
  /**
   * @dev Modifier to make a function callable only when the contract is not paused or the caller is the owner
   */
  modifier whenNotPausedOrIsOwner() {
    require(!paused || msg.sender == owner);
    _;
  }
}