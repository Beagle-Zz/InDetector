contract c40731{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}