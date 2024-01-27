contract c12382{
  /*
  manager use this function to revoke a confirm of the operation
  revoke will not be call inside other functions, so it can be external to save some gas
  @param {bytes} data is the transaction's raw input
  */
  function revoke(bytes data) external isManager {
    checkData(data);
    bytes32 op = keccak256(data);
    if (confirms[op][msg.sender] == true) {
      confirms[op][msg.sender] = false;
    }
    emit Revoke(msg.sender, data);
  }
}