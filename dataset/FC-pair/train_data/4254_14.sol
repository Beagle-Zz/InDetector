contract c4254{
  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address that transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    owner = newOwner;
    emit OwnershipTransferred(owner, newOwner);
  }
}