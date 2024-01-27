contract c16323{
  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public returns (bool) {
    require(newOwner != address(0x0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
    return true;
  }
}