contract c40628{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}