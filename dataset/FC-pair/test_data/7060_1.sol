contract c7060{
  /// @dev Add a valid member address. Only owner.
  function addMember(address _member) public onlyOwner {
    members[_member] = true;
  }
}