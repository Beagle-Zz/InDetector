contract c13617{
  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  /*@CTK transferOwnership
    @post __reverted == false -> (msg.sender == owner -> __post.owner == newOwner)
    @post (owner != msg.sender) -> (__reverted == true)
    @post (newOwner == address(0)) -> (__reverted == true)
   */
  /* CertiK Smart Labelling, for more details visit: https://certik.org */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}