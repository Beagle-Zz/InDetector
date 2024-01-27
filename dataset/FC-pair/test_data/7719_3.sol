contract c7719{
  /**
   * @dev Allows the current owner to transfer mint control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferMintOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit MintOwnershipTransferred(mintOwner, newOwner);
    mintOwner = newOwner;
  }
}