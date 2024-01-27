contract c7201{
  /// @dev Remove a member address. Only owner.
  function removeMember(address _member) public onlyOwner {
    delete members[_member];
  }
}