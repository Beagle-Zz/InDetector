contract c40164{
   
  function setName(bytes32 _name) onlyOwnerUnlocked setter {
    name = _name;
  }
}