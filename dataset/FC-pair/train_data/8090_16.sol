contract c8090{
  /**
   * @dev Allows the current pending owner to claim the ownership of the contract. It emits
   * OwnershipTransferred event and resets pending owner to 0.
   */
  function claimOwnership()
    public
  {
    require(msg.sender == pendingOwner);
    address previousOwner = owner;
    owner = pendingOwner;
    pendingOwner = 0;
    emit OwnershipTransferred(previousOwner, owner);
  }
}