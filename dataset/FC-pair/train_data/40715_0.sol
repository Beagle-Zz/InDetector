contract c40715{
   
  modifier onlyowner() { if (msg.sender == owner) _; }
}