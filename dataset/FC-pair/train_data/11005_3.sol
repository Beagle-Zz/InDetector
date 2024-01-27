contract c11005{
  /**
   * @dev Throws if contract is not paused
   */
  modifier isPaused() {
    require(paused);
    _; 
  }
}