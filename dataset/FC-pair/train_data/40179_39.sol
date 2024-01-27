contract c40179{
   
  function setName(bytes32 _name) onlyOwnerUnlocked setter {
    name = _name;
  }
}