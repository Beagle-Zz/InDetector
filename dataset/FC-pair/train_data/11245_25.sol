contract c11245{
  /// @return true if crowdsale event has ended
  function hasEnded() public view returns (bool) {
    bool capReached = weiRaised >= cap;
    return capReached || now > endTime; // solium-disable-line security/no-block-members
  }
}