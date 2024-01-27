contract c2593{
  // Only owner address can set owner address
  function ownerChangeOwner(address newOwner) public
  onlyOwner
  {
    owner = newOwner;
  }
}