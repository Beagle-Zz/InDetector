contract c64{
  // Calls the passed-in function, performing a memory state check before and after the check
  // is executed.
  function checks(function () pure _check) conditions(validState, validState) internal pure {
    _check();
  }
}