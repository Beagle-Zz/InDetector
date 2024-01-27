contract c40643{
   
  modifier manager() { if (msg.sender == owner) _; }
}