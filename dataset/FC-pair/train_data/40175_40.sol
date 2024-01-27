contract c40175{
   
  function setSymbol(bytes32 sym) onlyOwnerUnlocked setter {
    symbol = sym;
  }
}