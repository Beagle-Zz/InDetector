contract c65{
  // Checks that a call pushing an event to the buffer is expected and valid
  function validEvent() private pure {
    // Ensure that the next function expected pushes an event -
    if (expected() != NextFunction.EMIT_LOG)
      revert('Unexpected function order - expected event to be pushed');
    // Ensure that the current buffer is pushing EMITS actions -
    isEmitting();
  }
}