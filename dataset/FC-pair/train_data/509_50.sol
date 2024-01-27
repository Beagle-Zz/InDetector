contract c509{
  // Returns the location of an app's list of versions
  function appVersionList(bytes32 _app, address _provider) internal pure returns (bytes32)
    { return keccak256('versions', appBase(_app, _provider)); }
}