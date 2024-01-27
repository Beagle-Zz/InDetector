contract c12561{
  /*
  once the operation is executed, the confirm of the operation should be removed
  */
  function removeConfirm(bytes data) internal {
    bytes32 op = keccak256(data);
    for (uint i=0; i<managerList.length; i++) {
      confirms[op][managerList[i]] = false;
    }
  }
}