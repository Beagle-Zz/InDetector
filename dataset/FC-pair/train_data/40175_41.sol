contract c40175{
   
  function setPrecisionDirect(uint8 precision) onlyOwnerUnlocked {
    decimals = precision;
    PrecisionSet(msg.sender, precision);
  }
}