contract c40542{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}