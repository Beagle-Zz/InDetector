contract c14579{
  /**
   * @dev Allows the owner to cancel the reservation thus enabling withdraws.
   * Contract must first be paused so we are sure we are not accepting deposits.
   */
  function cancel() public onlyOwner whenPaused whenNotPaid {
    canceled = true;
  }
}