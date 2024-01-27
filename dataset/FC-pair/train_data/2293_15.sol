contract c2293{
  /// @notice Change refill rate of bucket
  /// @dev Require owner role to call
  /// @param _rate is new refill rate of bucket
  /// @return A boolean that indicates if the operation was successful.
  function setRate(uint256 _rate) public onlyOwner returns (bool) {
    rate = _rate;
    return true;
  }
}