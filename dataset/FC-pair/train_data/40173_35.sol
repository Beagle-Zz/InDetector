contract c40173{
   
  function setMembership(address addr) onlyOwnerUnlocked setter {
    membershipAddress = addr;
  }
}