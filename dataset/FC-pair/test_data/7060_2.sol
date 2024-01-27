contract c7060{
  /// @dev Remove a member address. Only owner.
  function removeMember(address _member) public onlyOwner {
    delete members[_member];
  }
}