contract c8899{
  /**
   * @dev Modifier to make a function callable based on pause states.
   */
  modifier whenNotPaused() {
    if(pausedPublic) {
      if(!pausedOwnerAdmin) {
        require(msg.sender == owner);
      } else {
        revert();
      }
    }
    _;
  }
}