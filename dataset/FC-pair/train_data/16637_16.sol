contract c16637{
  // Gets an owner by 0-indexed position (using numOwners as the count)
  function getOwner(uint ownerIndex) constant returns (address) {
    return address(m_owners[ownerIndex + 1]);
  }
}