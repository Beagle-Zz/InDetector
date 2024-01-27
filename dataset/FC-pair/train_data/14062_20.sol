contract c14062{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function sellpause() onlyOwner whenSellNotPaused public {
    sellPaused = true;
  }
}