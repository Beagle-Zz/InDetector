contract c12561{
  /*
  check a operation is confirmed or not
  */
  function isConfirmed(bytes data) public view isManager returns (bool) {
    bytes32 op = keccak256(data);
    return confirms[op][msg.sender];
  }
}