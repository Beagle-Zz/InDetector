contract c40632{
 
modifier manager() { if (msg.sender == owner) _; }
}