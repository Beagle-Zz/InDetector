contract c7489{
  /// @dev Override for extensions that require an internal state to check for validity (current user contributions, etc.)
  /// @param _beneficiary Address receiving the tokens
  /// @param _weiAmount Value in wei involved in the purchase
  function _updatePurchasingState(address _beneficiary, uint256 _weiAmount)
    internal
  {
    uint256 _tokenAmount = _getTokenAmount(_weiAmount);
    // Add token amount to the purchase history
    purchaseRecords[_beneficiary] = purchaseRecords[_beneficiary].add(_tokenAmount);
    // Add token amount to total tokens sold
    totalTokensSold = totalTokensSold.add(_tokenAmount);
    // Finish the crowdsale...
    // ...if there is not a minimum purchase left
    if (crowdsaleTokenGoal.sub(totalTokensSold) < minimumTokenPurchase) {
      _finalization();
    }
    // ...if USD funding goal has been reached
    if (totalUSDRaised >= crowdsaleUSDGoal) {
      _finalization();
    }
    // ...if the time is after the crowdsale end time
    if (now > crowdsaleFinishTime) {
      _finalization();
    }
  }
}