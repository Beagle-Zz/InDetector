contract c40730{
     
    modifier onlyowner() { if (msg.sender == owner) _; }
}