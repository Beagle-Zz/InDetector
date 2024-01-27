contract c7950{
  // Empty remainder of the value in the
  // contract to the owners.
  function emptyRemainingsToOwners() private canEmptyRemainings {
    OWNERS.transfer(this.balance);
    returnedToOwners = true;
  }
}