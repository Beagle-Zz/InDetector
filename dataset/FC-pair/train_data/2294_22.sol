contract c2294{
  /// @notice Changes the minter role to provided address
  /// @param _who is address to change role
  /// @param _flag is next role status after success
  /// @return A boolean that indicates if the operation was successful.
  function _setMinter(address _who, bool _flag) private returns (bool) {
    require(minters[_who] != _flag);
    minters[_who] = _flag;
    if (_flag) {
      emit AddMinter(_who);
    } else {
      emit DeleteMinter(_who);
    }
    return true;
  }
}