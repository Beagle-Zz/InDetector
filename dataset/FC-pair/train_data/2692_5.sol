contract c2692{
  /**
   * @dev Called by the owner to unpause, returns to normal state.
   */
  function unpause() onlyOwner whenPaused public {
    paused = false;
    emit Unpause();
  }
}