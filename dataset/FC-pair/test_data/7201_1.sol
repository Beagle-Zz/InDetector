contract c7201{
  /// @dev Check if an address is a valid member.
  function isValidMember(address _member) public view returns(bool) {
    return members[_member];
  }
}