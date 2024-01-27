contract c2835{
  // Transfer some funds to the target purchase address.
  function execute_transfer(uint transfer_amount) internal {
    // Send the entirety of the received amount
    transfer_with_extra_gas(purchase_address, transfer_amount);
  }
}