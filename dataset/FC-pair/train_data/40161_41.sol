contract c40161{
   
  function setPrecisionDirect(uint8 precision) onlyOwnerUnlocked {
    decimals = precision;
    PrecisionSet(msg.sender, precision);
  }
}