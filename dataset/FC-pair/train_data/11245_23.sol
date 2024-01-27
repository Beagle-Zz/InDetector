contract c11245{
  // vault finalization task, called when owner calls finalize()
  function finalization() internal {
    if (goalReached()) {
      finalizationSuccessHook();
    } else {
      finalizationFailHook();
    }
  }
}