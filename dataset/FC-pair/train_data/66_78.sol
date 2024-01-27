contract c66{
  // Ensures that the sender is the admin address, and the sale is not finalized
  function onlyAdminAndNotFinal() internal view {
    if (address(Contract.read(admin())) != Contract.sender())
      revert('sender is not admin');
    if (Contract.read(isFinished()) != 0)
      revert('sale has already been finalized');
  }
}