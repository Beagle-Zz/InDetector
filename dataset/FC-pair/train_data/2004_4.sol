contract c2004{
  /// @dev Returns outcome
  /// @return Outcome
  function getOutcome()
      public
      view
      returns (int)
  {
      return outcome;
  }
}