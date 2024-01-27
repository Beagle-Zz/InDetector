contract c12687{
  // Check identity registration status
  function isRegistered(address _id) public view returns (bool) {
    return identities[_id].wallet != 0x0;
  }
}