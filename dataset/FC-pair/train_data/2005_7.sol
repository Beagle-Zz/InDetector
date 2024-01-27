contract c2005{
  /// @dev Returns if winning outcome is set
  /// @return Is outcome set?
  function isOutcomeSet()
      public
      view
      returns (bool)
  {
      return isSet;
  }
}