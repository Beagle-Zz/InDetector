contract c2293{
  /// @notice Look up for the minter role on providen address
  /// @param _who is address to look up
  /// @return A boolean of minter role
  function isMinter(address _who) public view returns (bool) {
    return minters[_who];
  }
}