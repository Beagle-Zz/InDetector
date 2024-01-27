contract c10808{
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
  function setEndsAt(uint time) public onlyOwner {
    assert(!finalized);
    assert(isUpdatable);
    assert(now <= time);// Don't change past
    assert(startsAt <= time);
    assert(now <= endsAt);
    CrowdsaleExt lastTierCntrct = CrowdsaleExt(getLastTier());
    if (lastTierCntrct.finalized()) throw;
    uint8 tierPosition = getTierPosition(this);
    for (uint8 j = tierPosition + 1; j < joinedCrowdsalesLen; j++) {
      CrowdsaleExt crowdsale = CrowdsaleExt(joinedCrowdsales[j]);
      assert(time <= crowdsale.startsAt());
    }
    endsAt = time;
    EndsAtChanged(endsAt);
  }
}