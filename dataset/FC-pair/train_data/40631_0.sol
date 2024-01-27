contract c40631{
 
modifier manager() { if (msg.sender == owner) _; }
}