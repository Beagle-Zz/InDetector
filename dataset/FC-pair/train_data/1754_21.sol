contract c1754{
  /// @notice Authorize a third party `_operator` to manage (send) `msg.sender`'s tokens.
  /// @param _operator The operator that wants to be Authorized
  function authorizeOperator(address _operator) public whenNotPaused {
    require(_operator != msg.sender, "You cannot authorize yourself as an operator");
    mAuthorized[_operator][msg.sender] = true;
    emit AuthorizedOperator(_operator, msg.sender);
  }
}