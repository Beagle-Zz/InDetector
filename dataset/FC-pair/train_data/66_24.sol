contract c66{
  // Reading from storage: //
  // Reads from storage, resolving the passed-in location to its true location in storage
  // by hashing with the exec id. Returns the data read from that location
  function read(bytes32 _location) internal view returns (bytes32 data) {
    data = keccak256(_location, execID());
    assembly { data := sload(data) }
  }
}