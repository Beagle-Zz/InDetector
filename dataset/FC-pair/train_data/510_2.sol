contract c510{
  /*
  Executes an initialized application associated with the given exec id, under the sender's address and with
  the given calldata
  @param _sender: The address reported as the call sender by the script exec contract
  @param _exec_id: The execution id corresponding to an instance of the application
  @param _calldata: The calldata to forward to the application
  @return n_emitted: The number of events emitted on behalf of the application
  @return n_paid: The number of destinations ETH was forwarded to on behalf of the application
  @return n_stored: The number of storage slots written to on behalf of the application
  */
  function exec(address _sender, bytes32 _exec_id, bytes _calldata) external payable returns (uint n_emitted, uint n_paid, uint n_stored) {
    // Ensure valid input and input size - minimum 4 bytes
    require(_calldata.length >= 4 && _sender != address(0) && _exec_id != bytes32(0));
    // Get the target address associated with the given exec id
    address target = getTarget(_exec_id, getSelector(_calldata));
    require(target != address(0), 'Uninitialized application');
    // Set the exec id and sender addresses for the target application -
    setContext(_exec_id, _sender);
    // Execute application and commit returned data to storage -
    require(address(target).delegatecall(_calldata) == false, 'Unsafe execution');
    (n_emitted, n_paid, n_stored) = executeAppReturn(_exec_id);
    // If no events were emitted, no wei was forwarded, and no storage was changed, revert -
    if (n_emitted == 0 && n_paid == 0 && n_stored == 0)
      revert('No state change occured');
    // Emit event -
    emit ApplicationExecution(_exec_id, target);
    // Ensure that any additional balance is transferred back to the sender -
    if (address(this).balance > 0)
      address(msg.sender).transfer(address(this).balance);
  }
}