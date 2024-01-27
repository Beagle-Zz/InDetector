contract c40704{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}