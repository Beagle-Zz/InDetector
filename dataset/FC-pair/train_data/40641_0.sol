contract c40641{
 
modifier manager() { if (msg.sender == owner) _; }
}