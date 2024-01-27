contract c71{
  // Ensures that the sender is the admin address, and the sale is not finalized
  function onlyAdminAndNotFinal() internal view {
    onlyAdmin();
    if (Contract.read(isFinished()) != 0)
      revert('sale has already been finalized');
  }
}