contract c508{
  // Returns the location of an app's list of versions
  function appVersionList(bytes32 _app) internal pure returns (bytes32)
    { return keccak256('versions', appBase(_app)); }
}