contract c40657{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}