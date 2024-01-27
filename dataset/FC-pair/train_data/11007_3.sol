contract c11007{
  /**
   * @dev Throws if contract is not paused
   */
  modifier isPaused() {
    require(paused);
    _; 
  }
}