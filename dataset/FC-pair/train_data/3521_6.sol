contract c3521{
  /**
   * @dev Upgrades the CodexRecordProxy to point at a new implementation. Only callable by the owner.
   *  Only upgrade the token after extensive testing has been done. The storage is append only.
   *  The new token must inherit from the previous token so the shape of the storage is maintained.
   * @param _version The version of the token
   * @param _implementation The address at which the implementation is available
   */
  function upgradeTo(string _version, address _implementation) public onlyOwner {
    require(
      keccak256(abi.encodePacked(_version)) != keccak256(abi.encodePacked(version)),
      "The version cannot be the same");
    require(
      _implementation != implementation,
      "The implementation cannot be the same");
    require(
      _implementation != address(0),
      "The implementation cannot be the 0 address");
    version = _version;
    implementation = _implementation;
    emit Upgraded(version, implementation);
  }
}