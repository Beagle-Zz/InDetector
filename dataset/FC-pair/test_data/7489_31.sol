contract c7489{
  /// @dev Gets the purchase records for a given address
  /// @param _beneficiary Tokan purchaser
  function getPurchaseRecord(address _beneficiary) 
    public 
    view 
    isWhitelisted(_beneficiary)
    returns(uint256)
  {
    return purchaseRecords[_beneficiary];
  }
}