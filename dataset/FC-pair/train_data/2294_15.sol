contract c2294{
  /// @notice Look up for the owner role on providen address
  /// @param _who is address to look up
  /// @return A boolean of owner role
  function isOwner(address _who) public view returns (bool) {
    return owners[_who];
  }
}