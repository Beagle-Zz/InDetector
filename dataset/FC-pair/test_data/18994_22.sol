contract c18994{
  /// @dev Change owning address of the token contract, specifically for minting
  /// @param self Stored token from token contract
  /// @param _newOwner Address for the new owner
  /// @return True if completed
  function changeOwner(TokenStorage storage self, address _newOwner) public returns (bool) {
    require((self.owner == msg.sender) && (_newOwner > 0));
    self.owner = _newOwner;
    emit OwnerChange(msg.sender, _newOwner);
    return true;
  }
}