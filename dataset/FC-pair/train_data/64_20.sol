contract c64{
  // Checks whether or not it is valid to create a PAYS action request -
  function validPayBuff() private pure {
    // Get pointer to current buffer - if zero, create a new buffer -
    if (buffPtr() == bytes32(0))
      startBuffer();
    // Ensure that the current action is not 'paying', and that the buffer has not already
    // completed an PAYS action -
    if (paid() != 0 || currentAction() == PAYS)
      revert('Duplicate request - pays');
  }
}