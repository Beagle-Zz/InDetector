contract c16329{
  /**
   * @dev Failsafe to reclaim ownership in the event sale is unable to
   *      return ownership. Reclaims ownership regardless of
   *      pending ownership transfer.
   */
  function reclaimOwnership() public onlyReclaimableOwner {
      // Erase any pending transfer.
      pendingOwner = address(0);
      // Transfer ownership.
      OwnershipTransferred(owner, reclaimableOwner);
      owner = reclaimableOwner;
      // Reset reclaimableOwner.
      reclaimableOwner = address(0);
  }
}