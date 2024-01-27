contract c2293{
  /// @notice Change size and refill rate of bucket
  /// @dev Require owner role to call
  /// @param _size is new size of bucket
  /// @param _rate is new refill rate of bucket
  /// @return A boolean that indicates if the operation was successful.
  function setSizeAndRate(uint256 _size, uint256 _rate) public onlyOwner returns (bool) {
    return setSize(_size) && setRate(_rate);
  }
}