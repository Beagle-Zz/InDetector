contract c10220{
  /**
   * Allows the current owner to transfer control of the contract to a newOwner.
   */
  function transferOwnership(address newOwner) onlyOwner {
    require(newOwner != address(0));      
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}