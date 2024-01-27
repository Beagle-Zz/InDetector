contract c7489{
  /// @dev Gets the total number of locks for a given address
  /// @param _beneficiary The address for which to look up the total number of locks
  function getNumberOfLocks(address _beneficiary)
    public
    view
    returns (uint)
  {
    return tokenLocks[_beneficiary].locks.length;
  }
}