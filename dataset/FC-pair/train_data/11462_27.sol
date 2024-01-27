contract c11462{
  /**
   * @dev called by the user to unpause at ICO end or by owner, returns token to unlocked state
   */
  function unpause() whenPaused public {
    require(!crowdsale.isActive() || msg.sender == owner); // Checks that ICO is ended
    paused = false;
    emit Unpause();
  }
}