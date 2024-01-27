contract c71{
  // Ensures the pending state change will only store
  function onlyStores() internal pure {
    if (Contract.paid() != 0 || Contract.emitted() != 0)
      revert('expected only storage');
    if (Contract.stored() == 0)
      revert('expected storage');
  }
}