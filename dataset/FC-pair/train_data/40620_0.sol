contract c40620{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}