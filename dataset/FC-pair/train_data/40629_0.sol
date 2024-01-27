contract c40629{
 
modifier manager() { if (msg.sender == owner) _; }
}