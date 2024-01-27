contract c12692{
  /// @dev Retrieve contract address at _key location, mostly for convenience
  /// @return Contract address or 0x0 if it does not exist
  function getReference(bytes32 _key) external view ifAuthorized(msg.sender, PRESIDENT) returns(address) {
      return references[_key];
  }
}