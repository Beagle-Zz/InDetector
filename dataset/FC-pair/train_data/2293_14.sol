contract c2293{
  /// @notice Change size of bucket
  /// @dev Require owner role to call
  /// @param _size is new size of bucket
  /// @return A boolean that indicates if the operation was successful.
  function setSize(uint256 _size) public onlyOwner returns (bool) {
    size = _size;
    return true;
  }
}