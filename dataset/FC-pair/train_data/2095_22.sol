contract c2095{
  // must be a normal address
  modifier mustCommonAddress() { 
    require (_isContract(msg.sender) == false);
    _; 
  }
}