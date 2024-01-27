contract c1532{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
    function pause() onlyAdminer whenNotPaused public {
        paused = true;
        emit Pause();
    }
}