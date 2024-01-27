contract c40167{
   
  function setPrecisionDirect(uint8 precision) onlyOwnerUnlocked {
    decimals = precision;
    PrecisionSet(msg.sender, precision);
  }
}