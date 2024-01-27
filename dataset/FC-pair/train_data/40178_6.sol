contract c40178{
   
  function setPrecisionDirect(uint8 precision) onlyOwnerUnlocked {
    decimals = precision;
    PrecisionSet(msg.sender, precision);
  }
}