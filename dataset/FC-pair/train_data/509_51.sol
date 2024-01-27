contract c509{
  // Returns the location of a version's name
  function versionBase(bytes32 _app, bytes32 _version, address _provider) internal pure returns (bytes32)
    { return keccak256(_version, 'version', appBase(_app, _provider)); }
}