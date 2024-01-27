contract c2090{
  /**
   * @dev called by the ceo to unpause, returns to normal state
   */
  function unpause() onlyCEO whenPaused public {
    paused = false;
    emit Unpause();
  }
}