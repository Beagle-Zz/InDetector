contract c8899{
  /**
   * @dev called by the owner to set new pause flags
   * pausedPublic can't be false while pausedOwnerAdmin is true
   */
  function pause(bool newPausedPublic, bool newPausedOwnerAdmin) onlyOwner public {
    require(!(newPausedPublic == false && newPausedOwnerAdmin == true));
    pausedPublic = newPausedPublic;
    pausedOwnerAdmin = newPausedOwnerAdmin;
    emit PausePublic(newPausedPublic);
    emit PauseOwnerAdmin(newPausedOwnerAdmin);
  }
}