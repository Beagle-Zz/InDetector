contract c40168{
   
  function setSymbol(bytes32 sym) onlyOwnerUnlocked setter {
    symbol = sym;
  }
}