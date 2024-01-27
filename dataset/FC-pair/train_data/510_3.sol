contract c510{
  /// APPLICATION RETURNDATA HANDLING ///
  /*
  This function parses data returned by an application and executes requested actions. Because applications
  are assumed to be stateless, they cannot emit events, store data, or forward payment. Therefore, these
  steps to execution are handled in the storage contract by this function.
  Returned data can execute several actions requested by the application through the use of an 'action requestor':
  Some actions mirror nested dynamic return types, which are manually encoded and decoded as they are not supported
  1. THROWS  - App requests storage revert with a given message
      --Format: bytes
        --Payload is simply an array of bytes that will be reverted back to the caller
  2. EMITS   - App requests that events be emitted. Can provide topics to index, as well as arbitrary length data
      --Format: Event[]
        --Event format: [uint n_topics][bytes32 topic_0]...[bytes32 topic_n][uint data.length][bytes data]
  3. STORES  - App requests that data be stored to its storage. App storage locations are hashed with the app's exec id
      --Format: bytes32[]
        --bytes32[] consists of a data location followed by a value to place at that location
        --as such, its length must be even
        --Ex: [value_0][location_0]...[value_n][location_n]
  4. PAYS    - App requests that ETH sent to the contract be forwarded to other addresses.
      --Format: bytes32[]
        --bytes32[] consists of an address to send ETH to, followed by an amount to send to that address
        --As such, its length must be even
        --Ex: [amt_0][bytes32(destination_0)]...[amt_n][bytes32(destination_n)]
  Returndata is structured as an array of bytes, beginning with an action requestor ('THROWS', 'PAYS', etc)
  followed by that action's appropriately-formatted data (see above). Up to 3 actions with formatted data can be placed
  into returndata, and each must be unique (i.e. no two 'EMITS' actions).
  If the THROWS action is requested, it must be the first event requested. The event will be parsed
  and logged, and no other actions will be executed. If the THROWS requestor is not the first action
  requested, this function will throw
  @param _exec_id: The execution id which references this application's storage
  @return n_emitted: The number of events emitted on behalf of the application
  @return n_paid: The number of destinations ETH was forwarded to on behalf of the application
  @return n_stored: The number of storage slots written to on behalf of the application
  */
  function executeAppReturn(bytes32 _exec_id) internal returns (uint n_emitted, uint n_paid, uint n_stored) {
    uint _ptr;      // Will be a pointer to the data returned by the application call
    uint ptr_bound; // Will be the maximum value of the pointer possible (end of the memory stored in the pointer)
    (ptr_bound, _ptr) = getReturnedData();
    // If the application reverted with an error, we can check directly for its selector -
    if (getAction(_ptr) == THROWS) {
      // Execute THROWS request
      doThrow(_ptr);
      // doThrow should revert, so we should never reach this point
      assert(false);
    }
    // Ensure there are at least 64 bytes stored at the pointer
    require(ptr_bound >= _ptr + 64, 'Malformed returndata - invalid size');
    _ptr += 64;
    // Iterate over returned data and execute actions
    bytes4 action;
    while (_ptr <= ptr_bound && (action = getAction(_ptr)) != 0x0) {
      if (action == EMITS) {
        // If the action is EMITS, and this action has already been executed, throw
        require(n_emitted == 0, 'Duplicate action: EMITS');
        // Otherwise, emit events and get amount of events emitted
        // doEmit returns the pointer incremented to the end of the data portion of the action executed
        (_ptr, n_emitted) = doEmit(_ptr, ptr_bound);
        // If 0 events were emitted, returndata is malformed: throw
        require(n_emitted != 0, 'Unfulfilled action: EMITS');
      } else if (action == STORES) {
        // If the action is STORES, and this action has already been executed, throw
        require(n_stored == 0, 'Duplicate action: STORES');
        // Otherwise, store data and get amount of slots written to
        // doStore increments the pointer to the end of the data portion of the action executed
        (_ptr, n_stored) = doStore(_ptr, ptr_bound, _exec_id);
        // If no storage was performed, returndata is malformed: throw
        require(n_stored != 0, 'Unfulfilled action: STORES');
      } else if (action == PAYS) {
        // If the action is PAYS, and this action has already been executed, throw
        require(n_paid == 0, 'Duplicate action: PAYS');
        // Otherwise, forward ETH and get amount of addresses forwarded to
        // doPay increments the pointer to the end of the data portion of the action executed
        (_ptr, n_paid) = doPay(_exec_id, _ptr, ptr_bound);
        // If no destinations recieved ETH, returndata is malformed: throw
        require(n_paid != 0, 'Unfulfilled action: PAYS');
      } else {
        // Unrecognized action requested. returndata is malformed: throw
        revert('Malformed returndata - unknown action');
      }
    }
    assert(n_emitted != 0 || n_paid != 0 || n_stored != 0);
  }
}