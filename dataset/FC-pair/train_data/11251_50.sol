contract c11251{
  /// @dev Internal function to determine if an address is a contract
  /// @param _addr The address being queried
  /// @return True if `_addr` is a contract
  function isContract(address _addr) internal view returns(bool) {
    uint256 size;
    if (_addr == 0) return false;
    assembly {
      size := extcodesize(_addr)
    }
    return size > 0;
  }
}