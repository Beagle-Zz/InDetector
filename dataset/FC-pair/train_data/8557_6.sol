contract c8557{
  /**
   * @dev Allows the current owner to relinquish control of the contract.
   */
  function enableRenounceOwnership() onlyOwner public {
    canRenounce = true;
  }
}