contract c13919{
  //@dev Modifier to check is message sender contains in mapping 'owners'.
  modifier onlyOwners() { 
    require (owners[msg.sender]); 
    _; 
  }
}