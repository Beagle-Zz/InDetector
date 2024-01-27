contract c40176{
   
  function setMembership(address addr) onlyOwnerUnlocked setter {
    membershipAddress = addr;
  }
}