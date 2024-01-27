contract c7486{
  /// @dev Transfers tokens held by timelock to all beneficiaries within the provided range.
  /// @param _beneficiary The user for which token locks should be released.
  function releaseTokensByAddress(address _beneficiary)
    external
    whenNotPaused
    onlyOwner
    returns (bool)
  {
    require(crowdsaleFinished);
    require(_release(_beneficiary));
    return true;
  }
}