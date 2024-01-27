contract c18677{
  /**
   * Allow crowdsale owner to close early or extend the crowdsale.
   *
   * This is useful e.g. for a manual soft cap implementation:
   * - after X amount is reached determine manual closing
   *
   * This may put the crowdsale to an invalid state,
   * but we trust owners know what they are doing.
   *
   */
  function setEndsAt(uint time) onlyOwner {
    if(now > time) {
      throw; // Don't change past
    }
    if(startsAt > time) {
      throw; // Prevent human mistakes
    }
    endsAt = time;
    EndsAtChanged(endsAt);
  }
}