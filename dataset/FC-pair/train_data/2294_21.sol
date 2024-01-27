contract c2294{
  /// @notice Changes the owner role to provided address
  /// @param _who is address to change role
  /// @param _flag is next role status after success
  /// @return A boolean that indicates if the operation was successful.
  function _setOwner(address _who, bool _flag) private returns (bool) {
    require(owners[_who] != _flag);
    owners[_who] = _flag;
    if (_flag) {
      emit AddOwner(_who);
    } else {
      emit DeleteOwner(_who);
    }
    return true;
  }
}