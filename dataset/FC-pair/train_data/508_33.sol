contract c508{
  // Sets a previously-passed-in destination in storage to the value
  function to(bytes32 _field, uint _val) internal pure {
    to(_field, bytes32(_val));
  }
}