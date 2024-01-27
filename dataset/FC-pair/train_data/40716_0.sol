contract c40716{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}