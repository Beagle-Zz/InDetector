contract c13919{
  /**
   *@dev internal function, called in constructor
   *Add initial owners in mapping 'owners'
  */
  function addInitialOwners (address[] _owners) internal {
    for (uint i = 0; i < _owners.length; i++){
      //@dev check for duplicate owner addresses
      require(!owners[_owners[i]]);
      owners[_owners[i]] = true;
    }
  }
}