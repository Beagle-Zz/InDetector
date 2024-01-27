contract c11063{
  /**
   * @dev Checks whether the goal has been reached.
   * @return Whether the goal was reached
   */
  function goalReached() public view returns (bool) {
    return weiRaised >= goal;
  }
}