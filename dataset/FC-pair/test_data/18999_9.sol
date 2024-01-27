contract c18999{
  /// @dev Permanent stops minting
  /// @param self Stored token from token contract
  /// @return True if completed
  function closeMint(TokenStorage storage self) public returns (bool) {
    require(self.owner == msg.sender);
    self.stillMinting = false;
    emit MintingClosed(true);
    return true;
  }
}