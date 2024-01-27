contract c2693{
  /**
   * @dev Returns information about token.
   * @param _id The ID of the token
   */
  function getToken(uint256 _id) external view returns (string name) {
    Token storage token = tokens[_id];
    name = token.name;
  }
}