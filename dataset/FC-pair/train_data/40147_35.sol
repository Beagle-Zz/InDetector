contract c40147{
   
  function setMembership(address addr) onlyOwnerUnlocked setter {
    membershipAddress = addr;
  }
}