contract c12561{
  /*
  manager use this function to confirm a operation
  confirm will not be call inside other functions, so it can be external to save some gas
  @param {bytes} data is the transaction's raw input
  */
  function confirm(bytes data) external isManager {
    checkData(data);
    bytes32 op = keccak256(data);
    if (confirms[op][msg.sender] == false) {
      confirms[op][msg.sender] = true;
    }
    emit Confirm(msg.sender, data);
  }
}