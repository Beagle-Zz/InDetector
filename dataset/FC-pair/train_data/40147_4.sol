contract c40147{
   
  function setName(bytes32 _name) onlyOwnerUnlocked setter {
    name = _name;
  }
}