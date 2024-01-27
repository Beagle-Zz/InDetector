contract c7486{
  /// @dev Gets the total amount of tokens for a given address
  /// @param _beneficiary The address for which to look up the total token amount
  function getTokenBalance(address _beneficiary)
    public
    view
    returns (uint)
  {
    return tokenLocks[_beneficiary].tokenBalance;
  }
}