contract c508{
  // Returns the location of a registered app's index address under a provider
  function versionIndex(bytes32 _app, bytes32 _version) internal pure returns (bytes32)
    { return keccak256('index', versionBase(_app, _version)); }
}