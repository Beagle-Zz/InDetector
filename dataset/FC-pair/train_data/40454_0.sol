contract c40454{
     
    modifier onlyowner() { if (msg.sender == owner) _; }
}